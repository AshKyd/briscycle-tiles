FROM nginx:stable-alpine

RUN apk add --no-cache git

# Clone fonts and organize them
RUN git clone https://github.com/klokantech/klokantech-gl-fonts /usr/share/nginx/html/fonts \
  && mv "/usr/share/nginx/html/fonts/KlokanTech Noto Sans Bold" /usr/share/nginx/html/fonts/Bold \
  && mv "/usr/share/nginx/html/fonts/KlokanTech Noto Sans Regular" /usr/share/nginx/html/fonts/Regular

# Copy Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy tiles and other assets
# Note: These should be in the same directory as the Dockerfile for the build context
COPY build/seqtiles /usr/share/nginx/html/seqtiles
COPY build/config.json /usr/share/nginx/html/config.json

EXPOSE 80