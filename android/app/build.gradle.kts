import java.util.Properties

plugins {
    id("com.android.application")
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

// Loads the upload keystore credentials from a file outside the repo so the
// secret never lives in source control. Falls back to env vars on CI.
val keystoreEnv: Map<String, String> = run {
    val candidates = listOf(
        File(System.getProperty("user.home"), ".config/quiniela/keystore.env"),
        rootProject.file("keystore.env"),
    )
    val parsed = candidates.firstOrNull { it.exists() }?.let { file ->
        val props = Properties()
        file.inputStream().use { props.load(it) }
        props.entries.associate { (k, v) -> k.toString() to v.toString() }
    } ?: emptyMap()

    listOf("ANDROID_KEY_ALIAS", "ANDROID_KEYSTORE_PASSWORD", "ANDROID_KEY_PASSWORD")
        .associateWith { (parsed[it] ?: System.getenv(it) ?: "").trim() }
}

val keystoreFile: File? = run {
    val candidates = listOf(
        File(System.getProperty("user.home"), ".config/quiniela/quiniela-upload.keystore"),
        rootProject.file("quiniela-upload.keystore"),
    )
    candidates.firstOrNull { it.exists() }
}

val signingConfigured: Boolean =
    keystoreFile != null &&
        keystoreEnv["ANDROID_KEY_ALIAS"]?.isNotEmpty() == true &&
        keystoreEnv["ANDROID_KEYSTORE_PASSWORD"]?.isNotEmpty() == true &&
        keystoreEnv["ANDROID_KEY_PASSWORD"]?.isNotEmpty() == true

android {
    namespace = "com.iaales.quiniela"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.iaales.quiniela"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    signingConfigs {
        if (signingConfigured) {
            create("upload") {
                storeFile = keystoreFile
                storePassword = keystoreEnv["ANDROID_KEYSTORE_PASSWORD"]
                keyAlias = keystoreEnv["ANDROID_KEY_ALIAS"]
                keyPassword = keystoreEnv["ANDROID_KEY_PASSWORD"]
            }
        }
    }

    buildTypes {
        getByName("debug") {
            // Sign debug builds with the upload key when available so SHA-1
            // matches the fingerprint registered in Firebase / Google Cloud.
            if (signingConfigured) {
                signingConfig = signingConfigs.getByName("upload")
            }
        }
        getByName("release") {
            signingConfig = if (signingConfigured) {
                signingConfigs.getByName("upload")
            } else {
                signingConfigs.getByName("debug")
            }
        }
    }
}

flutter {
    source = "../.."
}
