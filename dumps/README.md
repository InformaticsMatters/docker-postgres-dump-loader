# dumps
A directory for `.zip` files. These are copied into the container
but are protected from being pushed to GitHub. So - put your
`.zip` files here and then build and push the image to use it.

>   Only .zip files will go into the image

Typical compression command: -

    $ zip -er squonk-20200916.sql.zip squonk-20200916.sql
    Enter password:
    [...]
    
---
