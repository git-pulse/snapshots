REPO_URLS=\
		  git@github.com:Homebrew/homebrew-cask.git \
		  git@github.com:Homebrew/homebrew-core.git \
		  git@github.com:JuliaLang/julia.git \
		  git@github.com:MicrosoftDocs/azure-devops-docs.git \
		  git@github.com:MicrosoftDocs/azure-docs.git \
		  git@github.com:MicrosoftDocs/sql-docs.git \
		  git@github.com:MicrosoftDocs/visualstudio-docs.git \
		  git@github.com:PowerShell/PowerShell.git \
		  git@github.com:SeleniumHQ/selenium.git \
		  git@github.com:WebKit/WebKit.git \
		  git@github.com:ansible/ansible.git \
		  git@github.com:apache/airflow.git \
		  git@github.com:awsdocs/aws-cloudformation-user-guide.git \
		  git@github.com:awsdocs/aws-doc-sdk-examples.git \
		  git@github.com:awsdocs/aws-lambda-developer-guide.git \
		  git@github.com:chef/chef.git \
		  git@github.com:denoland/deno.git \
		  git@github.com:django/django.git \
		  git@github.com:docker/docker.github.io.git \
		  git@github.com:dotnet/AspNetCore.Docs.git \
		  git@github.com:dotnet/AspNetDocs.git \
		  git@github.com:dotnet/dotnet-api-docs.git \
		  git@github.com:elixir-lang/elixir.git \
		  git@github.com:facebook/docusaurus.git \
		  git@github.com:facebook/react-native.git \
		  git@github.com:facebook/react.git \
		  git@github.com:flutter/flutter.git \
		  git@github.com:freeCodeCamp/freeCodeCamp.git \
		  git@github.com:gatsbyjs/gatsby.git \
		  git@github.com:github/opensource.guide.git \
		  git@github.com:golang/go.git \
		  git@github.com:gradle/gradle.git \
		  git@github.com:home-assistant/core.git \
		  git@github.com:home-assistant/home-assistant.io.git \
		  git@github.com:jenkinsci/jenkins.git \
		  git@github.com:kubernetes/kubernetes.git \
		  git@github.com:laravel/framework.git \
		  git@github.com:matplotlib/matplotlib.git \
		  git@github.com:mdn/content.git \
		  git@github.com:microsoft/TypeScript.git \
		  git@github.com:microsoft/playwright.git \
		  git@github.com:microsoft/vscode-docs.git \
		  git@github.com:moby/moby.git \
		  git@github.com:mrdoob/three.js.git \
		  git@github.com:mui/material-ui.git \
		  git@github.com:nodejs/node.git \
		  git@github.com:numpy/numpy.git \
		  git@github.com:opencv/opencv.git \
		  git@github.com:pallets/flask.git \
		  git@github.com:pandas-dev/pandas.git \
		  git@github.com:phoenixframework/phoenix.git \
		  git@github.com:puppeteer/puppeteer.git \
		  git@github.com:pytorch/pytorch.git \
		  git@github.com:rails/rails.git \
		  git@github.com:raspberrypi/documentation.git \
		  git@github.com:reactjs/react.dev.git \
		  git@github.com:rust-lang/rust.git \
		  git@github.com:scikit-learn/scikit-learn.git \
		  git@github.com:sphinx-doc/sphinx.git \
		  git@github.com:spring-projects/spring-boot.git \
		  git@github.com:spring-projects/spring-framework.git \
		  git@github.com:spring-projects/spring-security.git \
		  git@github.com:sveltejs/svelte.git \
		  git@github.com:symfony/symfony-docs.git \
		  git@github.com:symfony/symfony.git \
		  git@github.com:tc39/ecma262.git \
		  git@github.com:tensorflow/tensorflow.git \
		  git@github.com:tidyverse/ggplot2.git \
		  git@github.com:travis-ci/docs-travis-ci-com.git \
		  git@github.com:twbs/bootstrap.git \
		  git@github.com:vercel/next.js.git \
		  git@github.com:vitejs/vite.git \
		  git@github.com:vuejs/vue.git \
		  git@github.com:w3c/csswg-drafts.git \
		  git@github.com:web-platform-tests/wpt.git \
		  git@github.com:webpack/webpack.js.org.git \
		  git@github.com:whatwg/html.git \

rank:
	node tools/git-pulse-rank.js

clones:
	mkdir build || true; \
	cd build; \
	for url in $(REPO_URLS); do \
		git clone $$url || true; \
	done; \
	git clone git@github.com:dotnet/docs.git	dotnet-docs; \
	git clone git@github.com:github/docs.git	github-docs; \
	git clone git@github.com:laravel/docs.git	laravel-docs; \
	git clone git@github.com:mongodb/docs.git	mongodb-docs; \
	git clone git@github.com:tensorflow/docs.git	tensorflow-docs; \
	git clone git@github.com:vuejs/docs.git		vuejs-docs; \
	git clone git@github.com:flutter/website.git	flutter-website; \
	git clone git@github.com:kubernetes/website.git	kubernetes-website

snapshots:
	cd build; \
	for dir in */; do \
		cd $$dir && git pull && time bash ../../tools/git-pulse; \
		cp *$$(date +"%Y-%m-%d")-pulse.* ../..; \
		cd ..; \
	done;

