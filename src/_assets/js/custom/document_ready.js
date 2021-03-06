$(document).ready(function(){
  $(document).foundation();
  if (!window.jXHR){
    var jxhr = document.createElement('script');
    jxhr.type = 'text/javascript';
    jxhr.src = "{% asset_path vendor/jXHR.js %}";
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(jxhr, s);
  }
  github.showRepos({
    user: '{{site.github_user}}',
    count: {{site.github_repo_count}},
    skip_forks: {{site.github_skip_forks}},
    target: '#gh_repos'
  });
});
