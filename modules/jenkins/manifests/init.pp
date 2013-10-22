class jenkins {

    include jenkins::repository

    package { "jenkins-package":
        name    => "jenkins",
        ensure  => installed,
        require => Class['jenkins::repository'],        
    }

    service { "jenkins-service":
        name      => "jenkins",
        ensure    => running,
        enable     => true,        
        hasstatus  => true,
        hasrestart => true,        
        provider => service,
        require   => Package["jenkins"],
    }

}