## Now that we see our Ruby app up and running, let's go push it up to GitHub so it can be transferred to our other cluster!

```
git init
```{{execute}}

Name your branch uniquely, and put in your email and name info
```
git checkout -b your-branch-name
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```

```
git add .
```{{execute}}

Make a commit!
```
git commit -m "first commit"
```

Add the repo that we'll use to transfer your code
```
git remote add origin https://github.com/pcarney8/applier-lab.git
```{{execute}}

Now push your work up to a branch with your name on it
```
git push -u origin your-branch-name
```

And now let's watch it come up in the other cluster!