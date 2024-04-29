# Adding new services
When adding new service, make sure that:

1. its k8s manifest is in `/manifests` and is named `<service-name>.yml`
2. its `deployment` is named the same as the service
3. its `service` is named the same as the service

## MongoDB password
Initial credentials for `root` account:
```
login: root
password: init_pass
```
#### To change:
Connect to database and auth, example:
```
mongosh mongodb://root:init_pass@{database_ip}:27017
``` 
Switch to admin:
```
use admin
```
Change password:
```
db.changeUserPassword("root", "new_pass")
```