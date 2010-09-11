<html>
<head>
<title>Twist</title>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false&language=ja"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.4.2.min.js"></script>
<link rel="stylesheet" href="/static/css/common.css" type="text/css" />
<link rel="stylesheet" href="/static/css/bubbles.css" type="text/css" media="screen" charset="utf-8" />
<body>
<div id="header-wrapper">
    <div id="header">
        <div id="logo">
        <h1><a href="/">Twist</a></h1>
        <h2>
        <a href="http://twitter.com/[% config.twitter_list.owner %]/[% config.twitter_list.list_id %]/" target="_blank">[% config.twitter_list.owner %]/[% config.twitter_list.list_id %]<a/>
        [% IF config.twitter_extra_members %]
        +[% config.twitter_extra_members.size %]( [% FOREACH  member IN config.twitter_extra_members %]<a href="http://twitter.com/[% member %]/" target="_blank">[% member %]</a> [% END %]
        )
        [% END %]
        </h2>
        </div>
    </div>
</div>
