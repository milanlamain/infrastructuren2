# BELANGRIJK!
# Dit is niet volledig mijn eigen geschreven script het grootste gedeelte komt van de volgende bron:
# https://opsnotice.xyz/docker-with-saltstack/
# Op dit geschreven script van de gebruiker: Valentin Ouvrard heb ik als basis gebruikt
# Zonder de intentie te hebben om plagiaat te plegen!

wordpress_app:
  docker_container.running:
    - name: wordpress_app
    - image: wordpress:latest
    - port_bindings: 8080
    - environment:
      - WORDPRESS_DB_HOST: db:3306
      - WORDPRESS_DB_PASSWORD: wordpress
    - links: wordpress:mysql

wordpress_db:
  docker_container.running:
    - name: wordpress
    - image: mariadb:latest
    - ports: 3306/tcp
    - binds: /mysql:/var/lib/mysql:rw
    - environment:
      - MYSQL_ROOT_PASSWORD: wordpress
      - MYSQL_DATABASE: wordpress
      - MYSQL_USER: wordpress
      - MYSQL_PASSWORD: wordpress