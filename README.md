# docker-react-env

> React + TypeScript + Vite

## 本地端開發

```
$ npm i

# 複製建立本地的env，再編輯想要的值
$ cp .env.example .env
 
$ npm run dev
```

## Docker

### Build Image

```
# my-react 可以換成其他名稱，但要記得改 docker-compose.yml 的 image
$ docker build -t my-react:latest .
```

### Run Container

```
$ docker-compose up
```

開啟 localhost:3030 和 localhost:3031，可以看到不同的值

### 客製環境參數

假設客製
1. 一個環境叫 `happy`
2. Url 用 `https://happy.happy.happy`
3. PORT 用 `3032` 開啟

開始 !

#### step01 建立 happy 的 env 檔

```
$ cp .env.example.docker-compose .env.docker-compose.happy
```

編輯 .env.docker-compose.happy
```
APP_DOCKER_API_URL=https://happy.happy.happy
APP_DOCKER_TITLE=HAPPY
```

#### step02 編輯 docker-compose.yml

```yml
version: '3'
services:
  # other services...
  # happy環境
  my-react-happy:
    image: my-react:latest # 用一開始建好的image
    container_name: my-react-happy
    restart: always
    ports:
      - 3032:80 # port目標3032
    env_file:
      - .env.docker-compose.happy # 用剛剛建立的 env 檔
```

儲存後，docker-compose up 再開啟 localhost:3032，即可看到 happy 環境的相關設定



## 參考

- [Dockerizing a React Application: Injecting Environment Variables at Build vs. Run Time](https://pamalsahan.medium.com/dockerizing-a-react-application-injecting-environment-variables-at-build-vs-run-time-d74b6796fe38)