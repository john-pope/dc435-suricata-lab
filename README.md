[Presentation Slides](https://docs.google.com/presentation/d/1do37lF5vOuz1AKqpTyiG4ylukzlRyk_rI-ldf8JPvfw/edit?usp=sharing)

```
docker compose up
```

test urls:

- http://localhost:43580
- http://localhost:43580/admin/
- http://localhost:43580/.env

```
tail -f logs/suricata/alerts.json
tail -f logs/nginx/access.log
```

[EveBox](https://localhost:43536) (username: admin, password is shown first time
after creating box in docker logs)

Change rules in
[docker/nginx/suricata/local.rules](docker/nginx/suricata/local.rules)

Then reload rules

```
docker compose exec nginx suricatasc -c reload-rules
```

Config is in
[docker/nginx/suricata/etc/suricata.yaml](docker/nginx/suricata/etc/suricata.yaml)
