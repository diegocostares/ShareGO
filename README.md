<p align="center">
  <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Escudo_de_la_Pontificia_Universidad_Cat%C3%B3lica_de_Chile.svg/1200px-Escudo_de_la_Pontificia_Universidad_Cat%C3%B3lica_de_Chile.svg.png" width="150px">
  <br>
    <h1 align="center">SHAREGO
    <h2 align="center"> Profesor: Juan Pablo Sandoval Alcocer
    <br>  </h2>

  <br>
</p>

## Integrantes

| Nombre              | Email             | Github                                             |
| ------------------- | ----------------- | -------------------------------------------------- |
| Diego Costa R.      | diegocostar@uc.cl | [@diegocostares](https://github.com/diegocostares) |
| Alejandro Plaza     | aplaza2@uc.cl     | [@aplaza2](https://github.com/aplaza2)             |
| Agustín Covarrubias | agucova@uc.cl     | [@agucova](https://github.com/agucova)             |

## Project

[link](https://github.com/IIC2143/grupo-54/projects/1)

## Deploy :video_game:

```shell
sudo apt install imagemagick
bundle install
rake yarn:install
rake db:create
rake db:migrate
rake db:seed
```

# Deployear cambios a Heroku

```shell
git push heroku main
```

Si es necesario aplicar las migraciones y seeds:

```shell
heroku run rake db:migrate
heroku run rake db:seed
```

# Heroku

La app está disponible en [Heroku](https://sharego-54.herokuapp.com/).
