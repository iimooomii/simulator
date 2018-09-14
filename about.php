<?php 
require_once('db-connect.php');
require_once('includes/start-navbar.inc.php');
include_once('includes/aside.inc.php');
?>
<div class="col">
    <div class="row">
        <div class="col-md-12 odds">
            <div class="row">
                <div class="col-md-12 odds-h1 odds-h1-large">
                    <div class="mb-2">About project</div>
                    <div class="odds-upcoming">
                        Betting Simulator
                    </div>
                </div>
                <img class="odds-flag odds-flag-large" src="" alt="">
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-12 about-content p-3">
            <h3>Simulator usage</h3>
            <p>
                This project is made to simulate betting on real sport events based on real results without using real money.
            </p>
            <h3>Gambling risk</h3>
            <p>
                Sometimes gambling can turn into seriuos addiction.
            </p>
        </div>
    </div>
</div>
<?php
require_once('includes/card.inc.php');
require_once('includes/end-footer.inc.php');