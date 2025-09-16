# Dockerfile for building Android APK
FROM openjdk:11-jdk

# Install required packages
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV ANDROID_HOME=/opt/android
ENV ANDROID_SDK_ROOT=/opt/android
ENV PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

# Create android directory
RUN mkdir -p $ANDROID_HOME

# Download and install Android Command Line Tools
RUN wget -q https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip \
    && unzip commandlinetools-linux-9477386_latest.zip -d $ANDROID_HOME/ \
    && rm commandlinetools-linux-9477386_latest.zip

# Accept licenses and install required SDK components
RUN yes | sdkmanager --licenses
RUN sdkmanager "platform-tools" "platforms;android-34" "build-tools;34.0.0"

# Set working directory
WORKDIR /app

# Copy project files
COPY . .

# Make gradlew executable
RUN chmod +x ./gradlew

# Build APK
RUN ./gradlew assembleDebug

# Create output directory
RUN mkdir -p /output

# Copy APK to output directory
RUN cp app/build/outputs/apk/debug/app-debug.apk /output/

# Set default command
CMD ["cp", "/output/app-debug.apk", "/app/"]

