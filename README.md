# wiki

the good old MHN wiki

## build and run

Edit env.sample and save it as .env

Make sure that [traefik](https://github.com/Mind-Hochschul-Netzwerk/traefik) and [ldap](https://github.com/Mind-Hochschul-Netzwerk/ldap) are up and running. Then:

    $ make dev

Navigate to [https://wiki.docker.localhost](https://wiki.docker.localhost). Tell your browser to accept
the self-signed certificate. You will have to repeat this step whenever you restart your container.

See the `ldap` README for login credentials for testing.

## adminer

Navigate to [http://wiki-adminer.docker.localhost](http://wiki-adminer.docker.localhost) and login with the credentials from `.env`
