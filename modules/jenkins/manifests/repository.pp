class jenkins::repository {

    $jenkins_gpg_key = "http://pkg.jenkins-ci.org/debian-stable/jenkins-ci.org.key"
    $jenkins_deb_repo = "deb http://pkg.jenkins-ci.org/debian-stable binary/"    

    exec { "import-custom-gpg-key":
        command => "/usr/bin/wget -O - $jenkins_gpg_key | sudo apt-key add -",
        path => ['/bin', '/usr/bin'],
        unless  => "sudo apt-key list | grep -i kohsuke",
    }    

    file { "jenkins-repo-sources":
        path    => "/etc/apt/sources.list.d/jenkins.list",
        content => $jenkins_deb_repo,
        notify  => Exec['update-sources'],
        require => Exec["import-custom-gpg-key"]
    }    

    exec { "update-sources":
        command     => "/usr/bin/apt-get update",
        refreshonly => true,
    }   
}