# Jekyll + Netlify

Useful image if you build your site with Jekyll inside your very own CI/CD and you deploy the site using Netlify CLI.

## Main dependencies

* ruby 3.0 (based on Ubuntu image)
* bundler
* node 18.x
* yarn
* rsync

## /app directory

A folder where to place all your site files with already provisioned Gemfile and package.json dependencies.
You can always overwrite those files and trigger your very own packages install.

## Gemfile packages

When re-downloading packages in your environment, make sure to indicate this cache folder:

```
bundle config set --local path 'vendor'
bundle install
```

* Jekyll (4.x)
* Jekyll Feed

## Package.json packages

When re-downloading packages in your environment, make sure to indicate this cache folder:

```
yarn install --cache-folder .yarn-cache
```

* netlify-cli: Manages your netlify site.
* lhci: Performs lighthouse checks.
* parcel: Bundles your site assets.
* npm-run-all: Performs parallel and sequential taks on node.
* tree-node-cli: Prints directories as a tree-like output.

## Running

```
docker run -d -p 8088:80 --name jekyll-netlify basiclines/jekyll-netlify
```

## Building & Publishing

```
docker build -t basiclines/jekyll-netlify:latest -f Dockerfile .
docker push basiclines/jekyll-netlify:latest
```

## Contributing

https://github.com/basiclines/docker-jekyll-netlify
