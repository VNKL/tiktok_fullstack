FROM node:16 AS builder


WORKDIR usr/src/front

ARG git_personal_token
RUN git config --global url."https://${git_personal_token}:@github.com/".insteadOf "https://github.com/"
RUN git clone https://github.com/VNKL/tiktok_front.git .

RUN npm install

RUN npm run build



FROM nginx:1.16.0-alpine

RUN rm /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/conf.d

COPY --from=builder usr/src/front/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
