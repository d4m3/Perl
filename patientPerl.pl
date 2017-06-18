#!/usr/bin/perl -w 

# Based on - Patient Portal Enrollments implemented in Python

use 5.18.0;
use warnings;
use Browser::Open qw (open_browser);
use IO::File;
use Tkx;
use Selenium::Remote::Driver;


# Create GUI window
my $mw = Tkx::widget->new(".");
$mw->g_wm_title("Automation");
$mw->g_wm_minsize(400,100);

#
#my $label = $mw->new_label(-text=>"LABEL1")->pack;

# Create Button
#my $button;
#$button = $mw->new_button(
#    -text => "Login", -command=>sub{},-command => sub { $button->m_configure(-text => "UB Login",);
#        Tkx::after(5000, sub{$mw->portal});
#    },
#);

# Button Creations
my $button;
my $button2;
$button = $mw->new_button(-text => "Web Login", -command => \&ubPortal);
$button2 = $mw->new_button(-text => "Cortext Login", -command => \&cortextPWDRest);

# Button postions
$button->g_pack(-padx => 10,-pady => 10,);
$button2->g_pack(-padx => 10,-pady => 10,);

Tkx::MainLoop();


# Functions
sub ubPortal{
    # Set Chrome as Default
    my $url = '<UBaddress>';
    open_browser($url)   
}

sub cortextPWDRest{
    # Set Chrome as driver for browser/Launch with WebDriver
    my $chrome_driver = Selenium::Remote::Driver->new;
    
    # Webpage Address   
    my $url = '<cortexSite>';
    
    # TODO - get admin name/credentials
    my $admin = '<USERNAME>';
    my $password = '<PASSWORD>';
    
    # TODO - get webpage
    $chrome_driver->get($url);
    
    # TODO: Admin Username, enter info and click enter
    # Username
    $chrome_driver->find_element_by_xpath("//input[\@id='username']");
    $chrome_driver->send_keys($admin);
    # Password
    $chrome_driver->find_element_by_id("password");
    $chrome_driver->send_keys($password);
    # Login
    $chrome_driver->find_element_by_xpath("//*[\@id='tabUsers']/a")->click();    
    
    # Sleep
    
    # TODO: Search Users
    $chrome_driver->find_element_by_xpath("//*[\@id='searchField']"); 
    
    
    # TODO - launch application (test with Word/Office)
}



