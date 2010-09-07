[%- FILTER null -%]

[% MACRO profile(screen_name) BLOCK %]
<img src="http://usericons.relucks.org/twitter/[% screen_name %]"><br />
<a href="http://twitter.com/[% screen_name %]">[% screen_name %]</a>
[% END -%]

[%- END #FILTER null -%]
