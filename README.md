# docker-node8sshd

本Docker环境基于官方Node 8 版本，安装如下的Node组件：

* nrm 默认使用taobao镜像
* npm 更新npm到最新版本
* cnpm 安装CNPM

端口默认提供：8080， 可以使用NODE_PORT更改。

然后安装SSH Server，SSH 可以通过两种方式登录：

* 密码 ： 用户名 root 密码：rootroot 缺省，可通过环境变量ROOT_PASSWD
* 密钥 ： 用户名 root 使用仓库中的id_rsa私钥免密登录


使用方法：

```
# 挂载工作目录到/root/work
 docker run -d -p 8000:8080 -v /e/nodework/morefun-vue-admin:/root/work seraya/node8env:latest
```

使用SSH登录Docker, 同正常Node App， 在工作目录下使用 `npm run dev` 启动
