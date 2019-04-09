# opwire-agent: sample command line in Perl


<!-- TOC -->

- [Installation](#installation)
  - [Checkout source code](#checkout-source-code)
  - [Download `opwire-agent`](#download-opwire-agent)
- [Call the service from browsers](#call-the-service-from-browsers)
- [Test the service with `curl`](#test-the-service-with-curl)
- [Contributing](#contributing)
- [License](#license)

<!-- /TOC -->

## Installation

### Checkout source code

Clone example source code from github repository:

```shell
git clone https://github.com/opwire/sample-cmdline-perl.git
```

Change the project home to current working directory:

```shell
cd sample-cmdline-perl
```

### Download `opwire-agent`

To download the latest `opwire-agent` on Linux/macOS/BSD systems, run:

```shell
curl https://opwire.org/opwire-agent/install.sh | bash
```

For other systems:

* Download the relevant [`opwire-agent`](https://github.com/opwire/opwire-agent/releases/latest) release,
* Extract the `opwire-agent` or `opwire-agent.exe` binary from the archive to example folder (current directory).

![project-home-dir](https://raw.github.com/opwire/sample-cmdline-perl/master/docs/assets/images/ls.png)

## Call the service from browsers

Execute the following command:

```shell
./opwire-agent serve -p=8888 --default-command="perl example.pl"
```

Make a simple REST request:

```curl
curl "http://localhost:8888/$?type=microservice&type=perl"
```

or open with a web browser:

![example-output](https://raw.github.com/opwire/sample-cmdline-perl/master/docs/assets/images/example.png)

## Test the service with `curl`

Execute the following command:

```shell
./opwire-agent serve -p=8888 --default-command="python example.py"
```

Make a HTTP request with `curl`:

```curl
curl -v --request POST \
  --url 'http://localhost:8888/$?type=microservice&type=perl' \
  --header 'opwire-execution-timeout: 0.5s' \
  --header 'opwire-explain-failure: 1' \
  --header 'opwire-explain-success: 1' \
  --header 'opwire-request-id: 34c8afe2-3b21-485e-b3f5-034907352516' \
  --data '{
  "name": "Opwire",
  "url": "https://opwire.org/"
}'
```

Result:

```plain
> POST /$?type=microservice&type=perl HTTP/1.1
> User-Agent: curl/7.35.0
> Host: localhost:8888
> Accept: */*
> opwire-execution-timeout: 0.5s
> opwire-explain-failure: 1
> opwire-explain-success: 1
> opwire-request-id: 34c8afe2-3b21-485e-b3f5-034907352516
> Content-Length: 54
> Content-Type: application/x-www-form-urlencoded
> 
* upload completely sent off: 54 out of 54 bytes
< HTTP/1.1 205 Reset Content
< Content-Type: text/plain
< X-Exec-Duration: 0.021656
< Date: Tue, 09 Apr 2019 06:02:57 GMT
< Transfer-Encoding: chunked
< 

[edition------------------------------------------------------------------------
{
  "revision": "3de2f29",
  "version": "v1.0.6-34-g3de2f29"
}
------------------------------------------------------------------------edition]

[request------------------------------------------------------------------------
{
  "header": {
    "Accept": [
      "*/*"
    ],
    "Content-Length": [
      "54"
    ],
    "Content-Type": [
      "application/x-www-form-urlencoded"
    ],
    "Opwire-Execution-Timeout": [
      "0.5s"
    ],
    "Opwire-Explain-Failure": [
      "1"
    ],
    "Opwire-Explain-Success": [
      "1"
    ],
    "Opwire-Request-Id": [
      "34c8afe2-3b21-485e-b3f5-034907352516"
    ],
    "User-Agent": [
      "curl/7.35.0"
    ]
  },
  "method": "POST",
  "params": null,
  "path": "/$",
  "query": {
    "type": [
      "microservice",
      "perl"
    ]
  }
}
------------------------------------------------------------------------request]

[command------------------------------------------------------------------------
{
  "provided": {
    "method": "POST",
    "resource": "",
    "timeout": 0.5
  },
  "resolved": {
    "command": "perl example.pl",
    "method": null,
    "resource": ":default-resource:",
    "timeout": 0.5
  }
}
------------------------------------------------------------------------command]

[settings-----------------------------------------------------------------------
{
  "MYSQL_PASSWORD": "root",
  "MYSQL_URL": "mysql://localhost:3306",
  "MYSQL_USERNAME": "root"
}
-----------------------------------------------------------------------settings]

[stdin--------------------------------------------------------------------------
{
  "name": "Opwire",
  "url": "https://opwire.org/"
}
--------------------------------------------------------------------------stdin]

[stdout-------------------------------------------------------------------------
{
   "OPWIRE_REQUEST" : {
      "header" : {
         "Content-Type" : [
            "application/x-www-form-urlencoded"
         ],
         "Content-Length" : [
            "54"
         ],
         "Opwire-Request-Id" : [
            "34c8afe2-3b21-485e-b3f5-034907352516"
         ],
         "Opwire-Explain-Failure" : [
            "1"
         ],
         "User-Agent" : [
            "curl/7.35.0"
         ],
         "Accept" : [
            "*/*"
         ],
         "Opwire-Explain-Success" : [
            "1"
         ],
         "Opwire-Execution-Timeout" : [
            "0.5s"
         ]
      },
      "method" : "POST",
      "params" : null,
      "query" : {
         "type" : [
            "microservice",
            "perl"
         ]
      },
      "path" : "/$"
   },
   "OPWIRE_EDITION" : {
      "revision" : "3de2f29",
      "version" : "v1.0.6-34-g3de2f29"
   },
   "OPWIRE_SETTINGS" : {
      "MYSQL_USERNAME" : "root",
      "MYSQL_PASSWORD" : "root",
      "MYSQL_URL" : "mysql://localhost:3306"
   },
   "input" : {
      "url" : "https://opwire.org/",
      "name" : "Opwire"
   }
}

-------------------------------------------------------------------------stdout]
* Connection #0 to host localhost left intact
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b your-new-feature`)
3. Commit your changes (`git commit -am "Add some feature"`)
4. Push to the branch (`git push origin your-new-feature`)
5. Create new Pull Request

## License

MIT

See [LICENSE](LICENSE) to see the full text.
