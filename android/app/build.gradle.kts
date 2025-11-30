
import java.util.Properties
import java.io.FileInputStream
plugins {
    id("com.android.application")
    // START: FlutterFire Configuration
    id("com.google.gms.google-services")
    // END: FlutterFire Configuration
    id("kotlin-android")
    // The Flutter Gradle Plugin must be applied after the Android and Kotlin Gradle plugins.
    id("dev.flutter.flutter-gradle-plugin")
}
val keyProperties = Properties()
val keystorePropertiesFile = rootProject.file("key.properties")
if (keystorePropertiesFile.exists()) {
    keystorePropertiesFile.inputStream().use { keyProperties.load(it) }
}

android {
    namespace = "com.example.stock_task"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
        isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.example.stock_task"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true

        externalNativeBuild {
        cmake {
            // Arguments to pass to the NDK build system.
            // See https://developer.android.com/ndk/guides/ndk-build for details.
           arguments.add("-DANDROID_SUPPORT_FLEXIBLE_PAGE_SIZES=ON")
        }
    }
    }
    signingConfigs {
        create("release") {
            keyAlias = keyProperties["keyAlias"] as String
            keyPassword = keyProperties["keyPassword"] as String
            storeFile = file(keyProperties["storeFile"] as String)
            storePassword = keyProperties["storePassword"] as String
        }
        
    }

    

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Release configuration
            signingConfig = signingConfigs.getByName("release")
            isMinifyEnabled = true
            proguardFiles(getDefaultProguardFile("proguard-android.txt"), "proguard-rules.pro")
        }
        debug {
            // Debug configuration
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false
           // applicationIdSuffix = ".debug"
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation ("com.google.firebase:firebase-messaging:23.4.1")
    implementation ("androidx.multidex:multidex:2.0.1")
    coreLibraryDesugaring ("com.android.tools:desugar_jdk_libs:2.1.4")
    implementation ("androidx.window:window:1.0.0")
    implementation ("androidx.window:window-java:1.0.0")
}

