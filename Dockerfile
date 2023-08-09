#베이스 이미지를 명시한다.
FROM node:alpine as builder

WORKDIR /app 

COPY package.json ./

# 추가적으로 필요한 파일들을 다운로드 받는다.
RUN npm install

COPY ./ ./

# 컨테이너 시작시 실행 할 명령어를 명시한다.
CMD [ "npm", "run", "build" ]



##RUN##
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
