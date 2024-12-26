FROM ubuntu:18.04 as appbuilder
# Prerequisites
RUN apt update && apt install -y curl git unzip xz-utils zip libglu1-mesa openjdk-8-jdk wget

WORKDIR /flutter

# Prepare Android directories and system variables
RUN mkdir -p Android/sdk
ENV ANDROID_SDK_ROOT /flutter/Android/sdk
RUN mkdir -p .android && touch .android/repositories.cfg

# Set up Android SDK
RUN wget -O sdk-tools.zip https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
RUN unzip sdk-tools.zip && rm sdk-tools.zip
RUN mv tools Android/sdk/tools
RUN cd Android/sdk/tools/bin && yes | ./sdkmanager --licenses
RUN cd Android/sdk/tools/bin && ./sdkmanager "build-tools;34.0.0" "platform-tools" "platforms;android-34" "sources;android-34"
ENV PATH "$PATH:/flutter/Android/sdk/platform-tools"

# Download Flutter SDK
RUN git clone https://github.com/flutter/flutter.git -b beta
ENV PATH "$PATH:/flutter/flutter/bin"

# Run basic check to download Dark SDK
RUN flutter upgrade
RUN flutter doctor
WORKDIR /app
COPY . .
ARG BUILD_NUM
RUN sed -i "s/DEBUG/$BUILD_NUM/" ./lib/env.dart
RUN sed -i "s/:\/\/localhost:8000/s:\/\/einvoice.jomfi.jomluz.com\/api/" ./lib/env.dart
RUN flutter pub get
RUN flutter build web --release --web-renderer html

# COPY ./ /modules/

FROM alpine
RUN apk add brotli nginx nginx-mod-http-brotli

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
COPY --from=appbuilder /app/build/web/ /usr/share/nginx/html
# COPY --from=web3deployer /cid /cid

CMD ["nginx", "-g", "daemon off;"]