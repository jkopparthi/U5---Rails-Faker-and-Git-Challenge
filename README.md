# simple_store

A simple Rails store application built for the Intro to Rails Assignnment.

It has a `Product` model (title, description, price, stock quantity) and a
`Category` model. Products are listed at `/products` and each product has its
own page at `/products/:id`. Seed data is loaded with `rails db:seed`.