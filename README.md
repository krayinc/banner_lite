# BannerLite

A Rails engine which enables the minimum banner management.

## Features

- BannerLite::Banner model and migration
- BannerLite::BannersController for CRUD banners
- A helper to show active banners

## Installation

Add a line below to your Gemfile and `bundle`.

`gem 'banner_lite'`

## Migration

(TBD)

## Make your own admin views

(TBD)

## Helpers

- `banners(banners = nil)`

e.g.

    <%= banners %>

emits something like:

    <a href="http://your.host/page"><img src="banner/image.png" /></a>

## License

This software is licensed under the MIT license.

Copyright 2014 KRAY Inc.
