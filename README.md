# gdgt gadget list Liquid Tag for Jekyll
This is a simple Liquid tag that allows you to easily embed your [gdgt](http://gdgt.com/) gadget list into your Jekyll installation.

## How to install
Copy `gdgt.rb` to your Jekyll `/_plugins` directory.

## How to use
Place a `gdgt` tag in your content file. E.g.

    {% gdgt gdgt_username width height %}

Note that width and height are optional.

The widget defaults to showing list counts next to your have, want and had tabs. If you wish to not have those counts there, add in the following into your `_config.yml`

    gdgt:
        show_list_count: false

## Author
Jon Ursenbach
jon@ursenba.ch

## License
[MIT](http://www.opensource.org/licenses/mit-license.php)
