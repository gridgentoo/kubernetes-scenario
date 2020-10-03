This indicates that our application should work now. Let's see what URL it was exposed through and try to access it via a web browser:
`oc get route`{{execute}}

```
NAME HOST/PORT PATH SERVICES PORT TERMINATION WILDCARD
wordpress wordpress-wp.127.0.0.1.nip.io wordpress 8080 edge/Allow None
```

You can access wordpress application by Clicking `Wordpress` tab located next to terminal, the WordPress application should display a configuration page. Choose you favorite language and press continue On the next page, just fill in the fields, as shown here, and click on Install WordPress.