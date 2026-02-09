# Younos

A website used to present myself to the world.
It contains my online CV and other topics (tbd).

## 📖 About this site

This is a static website built with the [Jekyll](https://jekyllrb.com/) engine and hosted via **GitHub Pages**. 

* **Goal**: tbd
* **Theme**: None
* **Key features**: tbd
* **Target audience**: Recruiters


## Getting started

### Prerequisites

Before running this project locally, ensure you have the following installed:

* **Ruby**: Version 3.4 or higher
* **Bundler**: `gem install bundler`
* **Jekyll**: `gem install jekyll`
* **Other dependencies**:
  * Bootstrap v5.3.8 present in `_sass` folder
  * NodeJS (for CoffeScript)

### Local installation

1. **Clone the repository:**

    ```bash
    git clone <myURL>
    cd <myFolder>
    ```

2. **Install dependencies:**

    ```bash
    bundle install
    ```

3. **Run the local server:**

    ```bash
    bundle exec jekyll serve
    ```

4. **View the site:**

    Open your browser to `http://localhost:4000`.


## Deployment & Configuration

### GitHub Pages setup

This site is configured to deploy automatically via **GitHub Actions**.

* **URL:** The site is live at `https://<myUsername>.github.io`
* **Branch:** The `gh-pages` branch serves as the source.

### Configuration

Most site-wide settings are located in `_config.yml`. Update these variables before your first deployment:

* `title`: The name of your site.
* `email`: Your contact info.
* `baseurl`: Set this to `""` if using a custom domain or `"/REPO-NAME"` if hosting on a project page.
* `url`: Your production URL.
* `github_username`: Your GitHub username.


## Content management

### Adding a new post

To add a blog post, create a file in the `_posts` directory using the following naming convention:
`YYYY-MM-DD-title-of-post.md`

Every post must include "Front Matter" at the top:

```markdown
---
layout: post
title: "Your Post Title"
date: 2026-02-09
categories: [Updates, Tech]
---
Your content goes here...
```

### Images and Assets

Place all images in the `assets/images/` folder and reference them using:
`{{ '/assets/images/your-image.png' | relative_url }}`

## License

This project is open-source and available under the [MIT License](https://mit-license.org/).
