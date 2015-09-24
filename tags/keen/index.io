<!DOCTYPE html>
<html lang="ja">
<head>

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

  	<meta property="og:title" content=" Keen.Io &middot;  MAN.IN.BLOG" />
  	<meta property="og:site_name" content="MAN.IN.BLOG" />
  	<meta property="og:url" content="http://onori.github.io/tags/keen/index.io/" />

    
    <meta property="og:type" content="website" />
    

  <title>
     Keen.Io &middot;  MAN.IN.BLOG
  </title>

    <meta name="description" content="マネージャー業務の日々 コード書くことが少なくなってる。最近はLaravelとElixir（言語のほう）に興味津々。" />

    <meta name="HandheldFriendly" content="True" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="shortcut icon" href="http://onori.github.io/images/favicon.ico">
	  <link rel="apple-touch-icon" href="http://onori.github.io/images/apple-touch-icon.png" />

    <link rel="stylesheet" type="text/css" href="http://onori.github.io/css/screen.css" />
    <link rel="stylesheet" type="text/css" href="http://onori.github.io/css/nav.css" />
    <link rel="stylesheet" type="text/css" href="//fonts.googleapis.com/css?family=Merriweather:300,700,700italic,300italic|Open+Sans:700,400|Inconsolata" />
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.8.0/styles/default.min.css" />

    
      
          <link href="http://onori.github.io/index.xml" rel="alternate" type="application/rss+xml" title="MAN.IN.BLOG" />
      
      
        <link href="http://onori.github.io/tags/keen.io/index.xml" rel="alternate" type="application/rss+xml" title="Keen.Io &middot; MAN.IN.BLOG" />
      
    
    <meta name="generator" content="Hugo 0.14" />

    <link rel="canonical" href="http://onori.github.io/tags/keen/index.io/" />

    
    <script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-79101-12', 'auto');
      ga('send', 'pageview');

    </script>
    
</head>
<body class="nav-closed">

  <div class="nav">
    <h3 class="nav-title">Menu</h3>
    <a href="#" class="nav-close">
        <span class="hidden">Close</span>
    </a>
    <ul>
        
        
        
    </ul>
    
    
    <a class="subscribe-button icon-feed" href="http://onori.github.io/tags/keen.io/index.xml">Subscribe</a>
    
</div>
<span class="nav-cover"></span>


 <div class="site-wrapper">




	<header class="main-header tag-head" style="background-image: url(http://onori.github.io/images/footer_lodyas.png)">

    <nav class="main-nav overlay clearfix">
      
        <a class="blog-logo" href="http://onori.github.io/"><img src="http://onori.github.io/images/logo.png" alt="Home" /></a>
      
      
        
          <a class="menu-button icon-feed" href="http://onori.github.io/tags/keen.io/index.xml">&nbsp;&nbsp;Subscribe</a>
        
      
    </nav>
    <div class="vertical">
        <div class="main-header-content inner">
            <h1 class="page-title">Keen.Io</h1>
            <h2 class="page-description">
                
            </h2>
        </div>
    </div>
</header>

<main class="content" role="main">
    

	<div class="extra-pagination inner">
    <nav class="pagination" role="navigation">
	
	<span class="page-number">Page 1 of 1</span>
	
</nav>

	</div>

	
	   
<article class="post post">
    <header class="post-header">
        <h2 class="post-title"><a href="http://onori.github.io/post/laravel-keenio-heroku">laravel&#43;Keen.io&#43;herokuで簡易解析</a></h2>
    </header>
    <section class="post-excerpt">
        <p>とあるシステムで簡単なアクセス解析をする必要があったため、 せっかくなので存在だけは知っていたKeen.ioを使ってみた。 Keen.io Keen.io は簡単にいうと解析サービス。 Googleアナリティクスとかmixpanelとかに近いっちゃー近いけど、 Keen.ioは基本的に 自分で 解析したい情報をJSONで投げる。 上述アクセスログに関しては、herokuのpostgreSQLなんかにぶっこんでるともったいない。 そんな時はログ基盤としてKeen.ioを使いましょ、って話。 とりあえずJSONでぶん投げておけば、「後で◯◯のデータを解析したい！」なんていう時にも役に立つ。 グラフの出力もしてくれるし。 そんなわけでHeroku + LaravelでのKeen.ioの使い方。 Heroku HerokuのアドオンからKeen.ioをインストール。 Developerプランは月50,000回のイベント送信まで無料。 ホント助かりまっせ！送信回数が増えたらぜひ有料プランを！ コンソールからインストール $ heroku addons:create keen:developer Herokuの管理画面から、Setting &gt; Config Variables &gt; Edit のような感じで環境設定値が入る。 Laravel .envファイルの編集 上記の環境設定は、.envファイルに同じように記述する。 .env KEEN_API_URL=#### KEEN_MASTER_KEY=#### . . . composerパッケージに追加 ありがたいことにLaravelからKeen.ioを利用が可能なcomposerパッケージを作ってくれている人がいる。 せっかくなので利用させていただきましょう。 https://github.com/garethtdavies/keen-io-laravel $ composer require wensleydale/keen-io-laravel:1.* $ composer update 更新が終了したら、パッケージ追加完了。 サービスプロバイダーとエイリアスの追加 config/app.php を開き、 'providers' =&gt; array( ... Wensleydale\KeenLaravel\KeenLaravelServiceProvider::class ) 'aliases' =&gt; array( ... 'Keen' =&gt; Wensleydale\KeenLaravel\KeenFacade::class, ) を追加したのち $ php artisan vendor:publish を実行すると、同じくconfigディレクトリ内にkeen.phpというファイルがジェネレイトされる。 keen.php keen.phpには先ほど.envファイルに記述した設定値を記述。 keen.php &lt;?php return array( ... <a class="read-more" href="http://onori.github.io/post/laravel-keenio-heroku">&raquo;</a></p>
    </section>
    <footer class="post-meta">
        
            <img class="author-thumb" src="http://onori.github.io/images/logo.png" alt="Author image" nopin="nopin" />
        
        
            onori
        
        on
            
                <a href="http://onori.github.io/tags/laravel/">#laravel</a>,
            
                <a href="http://onori.github.io/tags/keen.io/">#Keen.io</a>,
            
                <a href="http://onori.github.io/tags/heroku/">#heroku</a>,
            
        
        <time class="post-date" datetime="2015-08-18T22:09:24&#43;09:00">
            18 Aug 2015
        </time>
    </footer>
</article>

	

	<nav class="pagination" role="navigation">
	
	<span class="page-number">Page 1 of 1</span>
	
</nav>

</main>



    <footer class="site-footer clearfix">
        <section class="copyright"><a href="">MAN.IN.BLOG</a> All rights reserved - 2015</section>
        
        <section class="poweredby">Proudly generated by <a class="icon-hugo" href="http://gohugo.io">HUGO</a>, with <a class="icon-theme" href="https://github.com/vjeantet/hugo-theme-casper">Casper</a> theme</section>
        
    </footer>
    </div>
    <script type="text/javascript" src="http://onori.github.io/js/jquery.js"></script>
    <script type="text/javascript" src="http://onori.github.io/js/jquery.fitvids.js"></script>
    <script type="text/javascript" src="http://onori.github.io/js/index.js"></script>
    <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/8.8.0/highlight.min.js"></script>
    <script>hljs.initHighlightingOnLoad();</script>

</body>
</html>
