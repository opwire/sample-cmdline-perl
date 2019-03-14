# opwire-agent: sample command line in Perl

## Install

Clone example source code from `github`:

```shell
git clone https://github.com/opwire/sample-cmdline-perl.git
```

Change the project home to current working directory:

```shell
cd sample-cmdline-perl
```

Download and extract the latest [`opwire-agent`](https://github.com/opwire/opwire-agent/releases/latest) program into this directory:

![project-home-dir](https://raw.github.com/opwire/sample-cmdline-perl/master/docs/assets/images/ls.png)

## Run

Execute the following command:

```shell
./opwire-agent -p=8888 --default-command="perl example.pl"
```

Make a simple REST request:

```curl
curl "http://localhost:8888/run?type=microservice&type=perl"
```

or open with a web browser:

![example-output](https://raw.github.com/opwire/sample-cmdline-perl/master/docs/assets/images/example.png)

## License

MIT

See [LICENSE](LICENSE) to see the full text.
