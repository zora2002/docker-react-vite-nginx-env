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

### Image

```
# my-react 可以換成其他名稱
$ docker build -t my-react:latest .
```


## 參考

- [Dockerizing a React Application: Injecting Environment Variables at Build vs. Run Time](https://pamalsahan.medium.com/dockerizing-a-react-application-injecting-environment-variables-at-build-vs-run-time-d74b6796fe38)