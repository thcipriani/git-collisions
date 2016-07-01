This repo contains a dumb script I made to find leading character collisions in
the git object hashes.

It also contains a handful of objects that contain leading character collisions.

Code like:

```php
foreach($gitObjects as $gitObject) {
    $hash = preg_replace('/[a-z0-9]{2}/', '\1/', "$gitObject", 3);
    mkdir($hash, 0755, recursive=true);
}
```

Will fail when there are early collisions in object hashes.
