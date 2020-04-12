# dTunnel

## What is dTunnel

Have your heard about `Ngrok`? `Serveo`?

If you dont, these are services that give you a public url for your local app, help you expose your project to the world (internet) without deploying it. So simple and easy to use, right?

The cons of Ngrok or Serveo is that you dont have a static, fixed address (the address will change every time you open), otherwise has a time limit.

This project using `inlets` and `heroku` (you can use it with any of other cloud services) to let you have your own address and full control of your tunnel.

Special thanks to [inlets](https://github.com/inlets/inlets)'s devs for a fantastic project.

## Step to use

First you need a Heroku app, of course. Then clone this project.

Config name of the app, and the local port which you want to expose

```
export HEROKU_APP=
export LOCAL_PORT=
export TOKEN=$(head -c 16 /dev/urandom | shasum | cut -f1 -d" ")
```

Then using heroku to build your app
```
heroku login
heroku git:remote -a $HEROKU_APP
heroku config:set TOKEN=${TOKEN} --app $HEROKU_APP
heroku buildpacks:set https://github.com/maximkulkin/heroku-buildpack-dummy.git
git push heroku master
```

You can restart your app in case of anything happenned
```
heroku restart web -a ${HEROKU_APP}
```

The using your inlets binary which matches your operating system to run the client (can be downloaded from [here](https://github.com/inlets/inlets/releases))
```
./inlets client \
  --remote wss://${HEROKU_APP}.herokuapp.com \
  --token $TOKEN \
  --upstream http://127.0.0.1:$LOCAL_PORT
```
