mcollective-plugin-postfix
========================

Mcollective Postfix plugin 

this plugin provides various functions for postfix with mcollective

Installation
------------

* Follow the [basic plugin install guide](http://projects.puppetlabs.com/projects/mcollective-plugins/wiki/InstalingPlugins)

Usage
-----

Show queue

    $ mco postfix mailq
    Do you really want to perform network tests unfiltered? (y/n): y

     * [ ============================================================> ] 11 / 11

    node1.example.net                        
      message id etc,etc,etc
    node8.example.net                        
      queue is empty


Flush queue

    $ mco postfix flush
    Do you really want to perform network tests unfiltered? (y/n): y

     * [ ============================================================> ] 11 / 11

    node1.example.net                        Flushed queue
    node8.example.net                        Flushed queue

Empty queue

    $ mco postfix flush
    Do you really want to perform network tests unfiltered? (y/n): y

     * [ ============================================================> ] 11 / 11

    node1.example.net                        Removed all messages from queue
    node8.example.net                        Removed all messages from queue

Show last 10 lines from the mail log

    $ mco postfix log
    Do you really want to perform network tests unfiltered? (y/n): y

     * [ ============================================================> ] 11 / 11

    node1.example.net
     Apr 10 23:32:28 debian postfix/master[32652]: daemon started -- version 2.7.1, configuration /etc/postfix

    node8.example.net
     Apr 10 23:32:28 debian postfix/master[32652]: daemon started -- version 2.7.1, configuration /etc/postfix


