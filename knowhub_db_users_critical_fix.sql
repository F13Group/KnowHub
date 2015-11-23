


<!DOCTYPE html>
<html lang="en" class=" is-copy-enabled">
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Language" content="en">
    <meta name="viewport" content="width=1020">
    
    
    <title>KnowHub/knowhub_db_users_critical_fix.sql at master · F13Group/KnowHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png">
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png">
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png">
    <meta property="fb:app_id" content="1401488693436528">

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="F13Group/KnowHub" name="twitter:title" /><meta content="KnowHub" name="twitter:description" /><meta content="https://avatars3.githubusercontent.com/u/12799409?v=3&amp;s=400" name="twitter:image:src" />
      <meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars3.githubusercontent.com/u/12799409?v=3&amp;s=400" property="og:image" /><meta content="F13Group/KnowHub" property="og:title" /><meta content="https://github.com/F13Group/KnowHub" property="og:url" /><meta content="KnowHub" property="og:description" />
      <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">
    <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">
    <link rel="assets" href="https://assets-cdn.github.com/">
    <link rel="web-socket" href="wss://live.github.com/_sockets/OTAxODczNTowYTc0MTU5OTE2ZmM1NDY5MTdiM2RhZjFkNDA0MmQ5MTo3ZTUzOGM4OTBlZWRhM2Y3MWI1M2MwNDA2MDViNzMzZDRhMjQxMWFiYjA1NDQwZTE1ZmNlOTAyYzYwZTc5MGRi--657d07ce4b9e2ea948452122e5d9441fb64ed86a">
    <meta name="pjax-timeout" content="1000">
    <link rel="sudo-modal" href="/sessions/sudo_modal">

    <meta name="msapplication-TileImage" content="/windows-tile.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="selected-link" value="repo_source" data-pjax-transient>

    <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="55DFD102:17DA:39C567F:565319BC" name="octolytics-dimension-request_id" /><meta content="9018735" name="octolytics-actor-id" /><meta content="Gyrotank" name="octolytics-actor-login" /><meta content="08bd2ee7150424e90bd327a1bdf5976884cb5b4cf3883bab67c0b2cfbbf61b60" name="octolytics-actor-hash" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />
<meta content="Rails, view, blob#show" data-pjax-transient="true" name="analytics-event" />


  <meta class="js-ga-set" name="dimension1" content="Logged In">
    <meta class="js-ga-set" name="dimension4" content="Current repo nav">




    <meta name="is-dotcom" content="true">
        <meta name="hostname" content="github.com">
    <meta name="user-login" content="Gyrotank">

      <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#4078c0">
      <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

    <meta content="887bb9adcc7e4522f476d26406c627bd7f8ac244" name="form-nonce" />

    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-c79fa22183893ac9d00d2752c92b6e3299e34e82b645e00687bf410263e6c7f3.css" integrity="sha256-x5+iIYOJOsnQDSdSyStuMpnjToK2ReAGh79BAmPmx/M=" media="all" rel="stylesheet" />
    <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github2-01670f04b8ff0707cc9c7970a9fa98538ff92955cbcb7cae6dee34b13bcdd728.css" integrity="sha256-AWcPBLj/BwfMnHlwqfqYU4/5KVXLy3yube40sTvN1yg=" media="all" rel="stylesheet" />
    
    
    


    <meta http-equiv="x-pjax-version" content="bbcf4ead6f8bce8c82fdc431624e0647">

      
  <meta name="description" content="KnowHub">
  <meta name="go-import" content="github.com/F13Group/KnowHub git https://github.com/F13Group/KnowHub.git">

  <meta content="12799409" name="octolytics-dimension-user_id" /><meta content="F13Group" name="octolytics-dimension-user_login" /><meta content="37321743" name="octolytics-dimension-repository_id" /><meta content="F13Group/KnowHub" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="37321743" name="octolytics-dimension-repository_network_root_id" /><meta content="F13Group/KnowHub" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/F13Group/KnowHub/commits/master.atom" rel="alternate" title="Recent Commits to KnowHub:master" type="application/atom+xml">

  </head>


  <body class="logged_in   env-production windows vis-public page-blob">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>

    
    
    



      <div class="header header-logged-in true" role="banner">
  <div class="container clearfix">

    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <span class="mega-octicon octicon-mark-github"></span>
</a>


      <div class="site-search repo-scope js-site-search" role="search">
          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/F13Group/KnowHub/search" class="js-site-search-form" data-global-search-url="/search" data-repo-search-url="/F13Group/KnowHub/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
  <label class="js-chromeless-input-container form-control">
    <div class="scope-badge">This repository</div>
    <input type="text"
      class="js-site-search-focus js-site-search-field is-clearable chromeless-input"
      data-hotkey="s"
      name="q"
      placeholder="Search"
      aria-label="Search this repository"
      data-global-scope-placeholder="Search GitHub"
      data-repo-scope-placeholder="Search"
      tabindex="1"
      autocapitalize="off">
  </label>
</form>
      </div>

      <ul class="header-nav left" role="navigation">
        <li class="header-nav-item">
          <a href="/pulls" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:pulls context:user" data-hotkey="g p" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls">
            Pull requests
</a>        </li>
        <li class="header-nav-item">
          <a href="/issues" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:issues context:user" data-hotkey="g i" data-selected-links="/issues /issues/assigned /issues/mentioned /issues">
            Issues
</a>        </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com/" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
      </ul>

    
<ul class="header-nav user-nav right" id="user-links">
  <li class="header-nav-item">
      <span class="js-socket-channel js-updatable-content"
        data-channel="notification-changed:Gyrotank"
        data-url="/notifications/header">
      <a href="/notifications" aria-label="You have no unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
          <span class="mail-status all-read"></span>
          <span class="octicon octicon-bell"></span>
</a>  </span>

  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link tooltipped tooltipped-s js-menu-target" href="/new"
       aria-label="Create new…"
       data-ga-click="Header, create new, icon:add">
      <span class="octicon octicon-plus left"></span>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <ul class="dropdown-menu dropdown-menu-sw">
        
<a class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>


  <a class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>



  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="F13Group/KnowHub">This repository</span>
  </div>
    <a class="dropdown-item" href="/F13Group/KnowHub/issues/new" data-ga-click="Header, create new issue">
      New issue
    </a>

      </ul>
    </div>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name tooltipped tooltipped-s js-menu-target" href="/Gyrotank"
       aria-label="View profile and more"
       data-ga-click="Header, show menu, icon:avatar">
      <img alt="@Gyrotank" class="avatar" height="20" src="https://avatars0.githubusercontent.com/u/9018735?v=3&amp;s=40" width="20" />
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <div class="dropdown-menu  dropdown-menu-sw">
        <div class=" dropdown-header header-nav-current-user css-truncate">
            Signed in as <strong class="css-truncate-target">Gyrotank</strong>

        </div>


        <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="/Gyrotank" data-ga-click="Header, go to profile, text:your profile">
            Your profile
          </a>
        <a class="dropdown-item" href="/stars" data-ga-click="Header, go to starred repos, text:your stars">
          Your stars
        </a>
        <a class="dropdown-item" href="/explore" data-ga-click="Header, go to explore, text:explore">
          Explore
        </a>
          <a class="dropdown-item" href="/integrations" data-ga-click="Header, go to integrations, text:integrations">
            Integrations
          </a>
        <a class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">
          Help
        </a>

          <div class="dropdown-divider"></div>

          <a class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">
            Settings
          </a>

          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/logout" class="logout-form" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="u83DNuIlndwX7MiByEgHeV2EsFeabJ21J1hVgxDU72r1wx1GQFM6HGWfCBegP4JI7AX24KfixNXb4wBeA361qQ==" /></div>
            <button class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
              Sign out
            </button>
</form>
      </div>
    </div>
  </li>
</ul>


    
  </div>
</div>

      

      


    <div id="start-of-content" class="accessibility-aid"></div>

    <div id="js-flash-container">
</div>


    <div role="main" class="main-content">
        <div itemscope itemtype="http://schema.org/WebPage">
    <div class="pagehead repohead instapaper_ignore readability-menu">

      <div class="container">

        <div class="clearfix">
          

<ul class="pagehead-actions">

  <li>
        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="T8Xm2rPedaNVF8ODX0eRhZ8KgVuXJUsPv0mGzA4RgxvVoRRGPfQe+6vEaT7ZqojGdHu9oLvybbZ2d4phZ6PIdA==" /></div>      <input id="repository_id" name="repository_id" type="hidden" value="37321743" />

        <div class="select-menu js-menu-container js-select-menu">
          <a href="/F13Group/KnowHub/subscription"
            class="btn btn-sm btn-with-count select-menu-button js-menu-target" role="button" tabindex="0" aria-haspopup="true"
            data-ga-click="Repository, click Watch settings, action:blob#show">
            <span class="js-select-button">
              <span class="octicon octicon-eye"></span>
              Unwatch
            </span>
          </a>
          <a class="social-count js-social-count" href="/F13Group/KnowHub/watchers">
            15
          </a>

        <div class="select-menu-modal-holder">
          <div class="select-menu-modal subscription-menu-modal js-menu-content" aria-hidden="true">
            <div class="select-menu-header">
              <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
              <span class="select-menu-title">Notifications</span>
            </div>

              <div class="select-menu-list js-navigation-container" role="menu">

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input id="do_included" name="do" type="radio" value="included" />
                    <span class="select-menu-item-heading">Not watching</span>
                    <span class="description">Be notified when participating or @mentioned.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-eye"></span>
                      Watch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                    <span class="select-menu-item-heading">Watching</span>
                    <span class="description">Be notified of all conversations.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-eye"></span>
                      Unwatch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <div class="select-menu-item-text">
                    <input id="do_ignore" name="do" type="radio" value="ignore" />
                    <span class="select-menu-item-heading">Ignoring</span>
                    <span class="description">Never be notified.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <span class="octicon octicon-mute"></span>
                      Stop ignoring
                    </span>
                  </div>
                </div>

              </div>

            </div>
          </div>
        </div>
</form>
  </li>

  <li>
    
  <div class="js-toggler-container js-social-container starring-container ">

    <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/F13Group/KnowHub/unstar" class="js-toggler-form starred js-unstar-button" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="JvEOLIu4gFGQsqOeYZw7oVdXxNpArmvJ84bXtvJDFtAkWXDBZJGx9mreZFPbRFlBoVSu5nfXEydwCW2A46vmDA==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Unstar this repository" title="Unstar F13Group/KnowHub"
        data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">
        <span class="octicon octicon-star"></span>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/F13Group/KnowHub/stargazers">
          1
        </a>
</form>
    <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/F13Group/KnowHub/star" class="js-toggler-form unstarred js-star-button" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="3m+6gKb+pUozvsiirsv6E/oR1WSHwJiW/zhfXxepsBv4INRkUCmapMJQtt5cnpOOcJeYIoSL4NOorIi62gju6A==" /></div>
      <button
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star F13Group/KnowHub"
        data-ga-click="Repository, click star button, action:blob#show; text:Star">
        <span class="octicon octicon-star"></span>
        Star
      </button>
        <a class="social-count js-social-count" href="/F13Group/KnowHub/stargazers">
          1
        </a>
</form>  </div>

  </li>

  <li>
          <a href="#fork-destination-box" class="btn btn-sm btn-with-count"
              title="Fork your own copy of F13Group/KnowHub to your account"
              aria-label="Fork your own copy of F13Group/KnowHub to your account"
              rel="facebox"
              data-ga-click="Repository, show fork modal, action:blob#show; text:Fork">
            <span class="octicon octicon-repo-forked"></span>
            Fork
          </a>

          <div id="fork-destination-box" style="display: none;">
            <h2 class="facebox-header" data-facebox-id="facebox-header">Where should we fork this repository?</h2>
            <include-fragment src=""
                class="js-fork-select-fragment fork-select-fragment"
                data-url="/F13Group/KnowHub/fork?fragment=1">
              <img alt="Loading" height="64" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-128.gif" width="64" />
            </include-fragment>
          </div>

    <a href="/F13Group/KnowHub/network" class="social-count">
      0
    </a>
  </li>
</ul>

          <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public ">
  <span class="mega-octicon octicon-repo"></span>
  <span class="author"><a href="/F13Group" class="url fn" itemprop="url" rel="author"><span itemprop="title">F13Group</span></a></span><!--
--><span class="path-divider">/</span><!--
--><strong><a href="/F13Group/KnowHub" data-pjax="#js-repo-pjax-container">KnowHub</a></strong>

  <span class="page-context-loader">
    <img alt="" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
  </span>

</h1>

        </div>
      </div>
    </div>

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline ">
        <div class="repository-sidebar clearfix">
          
<nav class="sunken-menu repo-nav js-repo-nav js-sidenav-container-pjax js-octicon-loaders"
     role="navigation"
     data-pjax="#js-repo-pjax-container"
     data-issue-count-url="/F13Group/KnowHub/issues/counts">
  <ul class="sunken-menu-group">
    <li class="tooltipped tooltipped-w" aria-label="Code">
      <a href="/F13Group/KnowHub" aria-label="Code" aria-selected="true" class="js-selected-navigation-item selected sunken-menu-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /F13Group/KnowHub">
        <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Issues">
        <a href="/F13Group/KnowHub/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /F13Group/KnowHub/issues">
          <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
          <span class="js-issue-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

    <li class="tooltipped tooltipped-w" aria-label="Pull requests">
      <a href="/F13Group/KnowHub/pulls" aria-label="Pull requests" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g p" data-selected-links="repo_pulls /F13Group/KnowHub/pulls">
          <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull requests</span>
          <span class="js-pull-replace-counter"></span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

      <li class="tooltipped tooltipped-w" aria-label="Wiki">
        <a href="/F13Group/KnowHub/wiki" aria-label="Wiki" class="js-selected-navigation-item sunken-menu-item" data-hotkey="g w" data-selected-links="repo_wiki /F13Group/KnowHub/wiki">
          <span class="octicon octicon-book"></span> <span class="full-word">Wiki</span>
          <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
  </ul>
  <div class="sunken-menu-separator"></div>
  <ul class="sunken-menu-group">

    <li class="tooltipped tooltipped-w" aria-label="Pulse">
      <a href="/F13Group/KnowHub/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-selected-links="pulse /F13Group/KnowHub/pulse">
        <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>

    <li class="tooltipped tooltipped-w" aria-label="Graphs">
      <a href="/F13Group/KnowHub/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-selected-links="repo_graphs repo_contributors /F13Group/KnowHub/graphs">
        <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
        <img alt="" class="mini-loader" height="16" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-32.gif" width="16" />
</a>    </li>
  </ul>


</nav>

            <div class="only-with-full-nav">
                
<div class="js-clone-url clone-url open"
  data-protocol-type="http">
  <h3 class="text-small text-muted"><span class="text-emphasized">HTTPS</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small text-muted input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/F13Group/KnowHub.git" readonly="readonly" aria-label="HTTPS clone URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="js-clone-url clone-url "
  data-protocol-type="ssh">
  <h3 class="text-small text-muted"><span class="text-emphasized">SSH</span> clone URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small text-muted input-monospace js-url-field js-zeroclipboard-target"
           value="git@github.com:F13Group/KnowHub.git" readonly="readonly" aria-label="SSH clone URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>

  
<div class="js-clone-url clone-url "
  data-protocol-type="subversion">
  <h3 class="text-small text-muted"><span class="text-emphasized">Subversion</span> checkout URL</h3>
  <div class="input-group js-zeroclipboard-container">
    <input type="text" class="input-mini text-small text-muted input-monospace js-url-field js-zeroclipboard-target"
           value="https://github.com/F13Group/KnowHub" readonly="readonly" aria-label="Subversion checkout URL">
    <span class="input-group-button">
      <button aria-label="Copy to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </span>
  </div>
</div>



<div class="clone-options text-small text-muted">You can clone with
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=http&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="pjgULifUJL7tHOClJ+3wodQwCLljB9dwbitvOI8d7yZ2mUvaPFT6956Ps+5V5y+3YPpoSekIE5qQOOXCSNPUug==" /></div><button class="btn-link js-clone-selector" data-protocol="http" type="submit">HTTPS</button></form>, <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=ssh&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="J0zjgVPgvKtghEM6nKloNiPpvR3uMDCM/E5mB5fgy5x+Tko+PlH+IY26E7rBguQHnSDPfG2kI9oOGJKw/plnDQ==" /></div><button class="btn-link js-clone-selector" data-protocol="ssh" type="submit">SSH</button></form>, or <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=push" class="inline-form js-clone-selector-form is-enabled" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="K/ezw7ZyTqCkaxlYLW/bbJngeA2rF+eekxO/+j24QKtVm/fcu/anpg+7r7FEIBstMbnLLl0oF6XvrX2DMH+zdQ==" /></div><button class="btn-link js-clone-selector" data-protocol="subversion" type="submit">Subversion</button></form>.
  <a href="https://help.github.com/articles/which-remote-url-should-i-use" class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <span class="octicon octicon-question"></span>
  </a>
</div>
  <a href="https://windows.github.com" class="btn btn-sm sidebar-button" title="Save F13Group/KnowHub to your computer and use it in GitHub Desktop." aria-label="Save F13Group/KnowHub to your computer and use it in GitHub Desktop.">
    <span class="octicon octicon-desktop-download"></span>
    Clone in Desktop
  </a>

              <a href="/F13Group/KnowHub/archive/master.zip"
                 class="btn btn-sm sidebar-button"
                 aria-label="Download the contents of F13Group/KnowHub as a zip file"
                 title="Download the contents of F13Group/KnowHub as a zip file"
                 rel="nofollow">
                <span class="octicon octicon-cloud-download"></span>
                Download ZIP
              </a>
            </div>
        </div>
        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>

          

<a href="/F13Group/KnowHub/blob/d90a4099a1811a7518fb071c2f876b41c9929b18/knowhub_db_users_critical_fix.sql" class="hidden js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:c5fedaec77dce2c54fc563d6289bda62 -->

  <div class="file-navigation js-zeroclipboard-container">
    
<div class="select-menu js-menu-container js-select-menu left">
  <button class="btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    title="master"
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <i>Branch:</i>
    <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="octicon octicon-x js-menu-close" role="button" aria-label="Close"></span>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Find or create a branch…" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/AlekseyBranch/knowhub_db_users_critical_fix.sql"
               data-name="AlekseyBranch"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="AlekseyBranch">
                AlekseyBranch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/Development/knowhub_db_users_critical_fix.sql"
               data-name="Development"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="Development">
                Development
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/DimaBranch/knowhub_db_users_critical_fix.sql"
               data-name="DimaBranch"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="DimaBranch">
                DimaBranch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/DimaSortBranch/knowhub_db_users_critical_fix.sql"
               data-name="DimaSortBranch"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="DimaSortBranch">
                DimaSortBranch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/Dmytro_Korniienko/knowhub_db_users_critical_fix.sql"
               data-name="Dmytro_Korniienko"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="Dmytro_Korniienko">
                Dmytro_Korniienko
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/DmytroDerzhevytskyi/knowhub_db_users_critical_fix.sql"
               data-name="DmytroDerzhevytskyi"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="DmytroDerzhevytskyi">
                DmytroDerzhevytskyi
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/Dto-patch-1/knowhub_db_users_critical_fix.sql"
               data-name="Dto-patch-1"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="Dto-patch-1">
                Dto-patch-1
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/IgorBranch_Home/knowhub_db_users_critical_fix.sql"
               data-name="IgorBranch_Home"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="IgorBranch_Home">
                IgorBranch_Home
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/IgorBranch/knowhub_db_users_critical_fix.sql"
               data-name="IgorBranch"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="IgorBranch">
                IgorBranch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/Marharyta_Nedzelska/knowhub_db_users_critical_fix.sql"
               data-name="Marharyta_Nedzelska"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="Marharyta_Nedzelska">
                Marharyta_Nedzelska
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/Mykhailov/knowhub_db_users_critical_fix.sql"
               data-name="Mykhailov"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="Mykhailov">
                Mykhailov
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/OlegKuts/knowhub_db_users_critical_fix.sql"
               data-name="OlegKuts"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="OlegKuts">
                OlegKuts
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/OleksandrsBranch/knowhub_db_users_critical_fix.sql"
               data-name="OleksandrsBranch"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="OleksandrsBranch">
                OleksandrsBranch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/SessionTimeoutConfigDemo/knowhub_db_users_critical_fix.sql"
               data-name="SessionTimeoutConfigDemo"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="SessionTimeoutConfigDemo">
                SessionTimeoutConfigDemo
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/VitalinaVitiuk/knowhub_db_users_critical_fix.sql"
               data-name="VitalinaVitiuk"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="VitalinaVitiuk">
                VitalinaVitiuk
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/alyona_branch/knowhub_db_users_critical_fix.sql"
               data-name="alyona_branch"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="alyona_branch">
                alyona_branch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/dennis_branch/knowhub_db_users_critical_fix.sql"
               data-name="dennis_branch"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="dennis_branch">
                dennis_branch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/ivan_branch/knowhub_db_users_critical_fix.sql"
               data-name="ivan_branch"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="ivan_branch">
                ivan_branch
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/F13Group/KnowHub/blob/marina/knowhub_db_users_critical_fix.sql"
               data-name="marina"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="marina">
                marina
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/F13Group/KnowHub/blob/master/knowhub_db_users_critical_fix.sql"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <span class="select-menu-item-text css-truncate-target" title="master">
                master
              </span>
            </a>
        </div>

          <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/F13Group/KnowHub/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="lUZdCMIfJgrxKpQXl1NrATs791K8GlA4tgvrl+TNmvv1YnbssZL86zD7x5qC/K/pIMY8WIHlIp90ex3IiY34Bg==" /></div>
            <span class="octicon octicon-git-branch select-menu-item-icon"></span>
            <div class="select-menu-item-text">
              <span class="select-menu-item-heading">Create branch: <span class="js-new-item-name"></span></span>
              <span class="description">from ‘master’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="master">
            <input type="hidden" name="path" id="path" value="knowhub_db_users_critical_fix.sql">
</form>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

    <div class="btn-group right">
      <a href="/F13Group/KnowHub/find/master"
            class="js-show-file-finder btn btn-sm empty-icon tooltipped tooltipped-nw"
            data-pjax
            data-hotkey="t"
            aria-label="Quickly jump between files">
        <span class="octicon octicon-list-unordered"></span>
      </a>
      <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm zeroclipboard-button tooltipped tooltipped-s" data-copied-hint="Copied!" type="button"><span class="octicon octicon-clippy"></span></button>
    </div>

    <div class="breadcrumb js-zeroclipboard-target">
      <span class="repo-root js-repo-root"><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/F13Group/KnowHub" class="" data-branch="master" data-pjax="true" itemscope="url"><span itemprop="title">KnowHub</span></a></span></span><span class="separator">/</span><strong class="final-path">knowhub_db_users_critical_fix.sql</strong>
    </div>
  </div>


  <div class="commit-tease">
      <span class="right">
        <a class="commit-tease-sha" href="/F13Group/KnowHub/commit/d90a4099a1811a7518fb071c2f876b41c9929b18" data-pjax>
          d90a409
        </a>
        <time datetime="2015-11-23T13:11:16Z" is="relative-time">Nov 23, 2015</time>
      </span>
      <div>
        <img alt="@arctg" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/12535333?v=3&amp;s=40" width="20" />
        <a href="/arctg" class="user-mention" rel="contributor">arctg</a>
          <a href="/F13Group/KnowHub/commit/d90a4099a1811a7518fb071c2f876b41c9929b18" class="message" data-pjax="true" title="critical bug(non-unique field for login in db) fixed">critical bug(non-unique field for login in db) fixed</a>
      </div>

    <div class="commit-tease-contributors">
      <a class="muted-link contributors-toggle" href="#blob_contributors_box" rel="facebox">
        <strong>1</strong>
         contributor
      </a>
      
    </div>

    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
          <li class="facebox-user-list-item">
            <img alt="@arctg" height="24" src="https://avatars1.githubusercontent.com/u/12535333?v=3&amp;s=48" width="24" />
            <a href="/arctg">arctg</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="btn-group">
      <a href="/F13Group/KnowHub/raw/master/knowhub_db_users_critical_fix.sql" class="btn btn-sm " id="raw-url">Raw</a>
        <a href="/F13Group/KnowHub/blame/master/knowhub_db_users_critical_fix.sql" class="btn btn-sm js-update-url-with-hash">Blame</a>
      <a href="/F13Group/KnowHub/commits/master/knowhub_db_users_critical_fix.sql" class="btn btn-sm " rel="nofollow">History</a>
    </div>

        <a class="octicon-btn tooltipped tooltipped-nw"
           href="https://windows.github.com"
           aria-label="Open this file in GitHub Desktop"
           data-ga-click="Repository, open with desktop, type:windows">
            <span class="octicon octicon-device-desktop"></span>
        </a>

        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/F13Group/KnowHub/edit/master/knowhub_db_users_critical_fix.sql" class="inline-form js-update-url-with-hash" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="1O4ITgMbECrJG343pMWkavVUVo+2geqy++zKWQvjbb23AUZTvRGmDwKGBqpQ30kXNG/FTsRyGajZrjjodAzmJQ==" /></div>
          <button class="octicon-btn tooltipped tooltipped-nw" type="submit"
            aria-label="Edit this file" data-hotkey="e" data-disable-with>
            <span class="octicon octicon-pencil"></span>
          </button>
</form>        <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="/F13Group/KnowHub/delete/master/knowhub_db_users_critical_fix.sql" class="inline-form" data-form-nonce="887bb9adcc7e4522f476d26406c627bd7f8ac244" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="j0QJMfNn0nE3qvW3tHJhDaPRn3deAQljSCbzzOxMR4aOS11eWRDlAYWly6r6VjMZm9TWWs0SqoUotxOM8nEjVA==" /></div>
          <button class="octicon-btn octicon-btn-danger tooltipped tooltipped-nw" type="submit"
            aria-label="Delete this file" data-disable-with>
            <span class="octicon octicon-trashcan"></span>
          </button>
</form>  </div>

  <div class="file-info">
      3 lines (2 sloc)
      <span class="file-info-divider"></span>
    104 Bytes
  </div>
</div>

  

  <div class="blob-wrapper data type-sql">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c">-- Fix for non-unique field login in table users</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line"><span class="pl-k">ALTER</span> <span class="pl-k">TABLE</span> users ADD <span class="pl-k">CONSTRAINT</span> login UNIQUE (login);</td>
      </tr>
</table>

  </div>

</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <!-- </textarea> --><!-- '"` --><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>

        </div>
      </div>
      <div class="modal-backdrop"></div>
    </div>
  </div>


    </div>

      <div class="container">
  <div class="site-footer" role="contentinfo">
    <ul class="site-footer-links right">
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>
        <li><a href="https://github.com/pricing" data-ga-click="Footer, go to pricing, text:pricing">Pricing</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2015 <span title="0.06641s from github-fe139-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



    
    
    

    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
        <span class="octicon octicon-x"></span>
      </button>
      Something went wrong with that request. Please try again.
    </div>


      <script crossorigin="anonymous" integrity="sha256-fRgMK7V3nst6tdBM6K+ZnnODbc8N8ajES2nGKh3gcy8=" src="https://assets-cdn.github.com/assets/frameworks-7d180c2bb5779ecb7ab5d04ce8af999e73836dcf0df1a8c44b69c62a1de0732f.js"></script>
      <script async="async" crossorigin="anonymous" integrity="sha256-HY1QzaNHmXT/34aUUVgQh418xsJFwc7UkgVm/80usno=" src="https://assets-cdn.github.com/assets/github-1d8d50cda3479974ffdf8694515810878d7cc6c245c1ced4920566ffcd2eb27a.js"></script>
      
      
    <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner hidden">
      <span class="octicon octicon-alert"></span>
      <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
      <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
    </div>
  </body>
</html>

