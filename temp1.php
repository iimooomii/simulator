<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/style.css">
    <link href="https://fonts.googleapis.com/css?family=Palanquin+Dark" rel="stylesheet">
  </head>
  <body>
    <?php
      include('simple_html_dom.php');
      $html = file_get_html('http://www.sports-betting-explorer.com/great-britain.php');
      $elements1 = $html->find('span');
      $arrlength = count($elements1);
      $odds = array();
      for($x = 0; $x < $arrlength; $x++) {
        $element1 = str_replace('<span style="font-size:12px;font-weight:bold;background-color:#46B6E0;padding:2px;">', "", $elements1[$x]);
        $element2 = str_replace('</span><br><span style="font-size:10px;">', "", $element1);
        if (strlen($element2) < 12 ){
          $odds[count($odds)] = (float)$element2;
        }
      }
      $oddsf = array();

      for ($i=0; $i < count($odds); $i++) {
        // if ($odds[$i] > count($oddsf)) {
        //   $oddsf[$i] = array();
        // }
        $ceil = ceil(($i+1)/3)-1;
        $oddsf[$ceil][count($oddsf[$ceil])] = $odds[$i];
      }

      $matches = $html->find('#r98');
      for ($i=0; $i < count($matches); $i++) {
        $matches[$i] = (string)$matches[$i];
        $point = strpos($matches[$i], '-', 49) + 2;
        $team2 = substr($matches[$i], $point);
        $team1 = str_replace(' - ' . $team2, "", $matches[$i]);
        $team2 = str_replace('<br><span style="color:red;font-style:italic;"> </span></td>', "", $team2);
        $team1 = str_replace('<td scope="row" id="r98" width="180" style="font-weight:bold;">', "", $team1);
        $oddsf[$i][3] = $team1;
        $oddsf[$i][4] = $team2;
      }

      $dates = array();
      foreach ($html->find('td') as $td) {
        if ($td->width == 80) {
          $dates[count($dates)] = (string)$td;
        }
      }
      for ($i=0; $i < count($dates); $i++) {
        $dates[$i] = str_replace('<td width="80">', "", $dates[$i]);
        $dates[$i] = str_replace('</td>', "", $dates[$i]);
      }
      for ($i=0; $i < count($dates); $i++) {
        $oddsf[$i][5] = $dates[$i];
      }

      $times = array();
      foreach ($html->find('td') as $td) {
        if ($td->width == 50) {
          $times[count($times)] = (string)$td;
        }
      }
      for ($i=0; $i < count($times); $i++) {
        $times[$i] = str_replace('<td width="50">', "", $times[$i]);
        $times[$i] = str_replace('</td>', "", $times[$i]);
      }
      for ($i=0; $i < count($times); $i++) {
        $oddsf[$i][6] = $times[$i];
      }

      print_r($oddsf);
      echo "<br />";
      // var_dump(get_object_vars($html));
      // echo gettype($oddsf[3][3]);
      // echo gettype($odds[0]);
      // echo $html;
      // foreach($html->find('dialog') as $element)
      //  echo $element->id . '<br>';

      // $html = file_get_html('http://www.betexplorer.com/soccer/england/premier-league/fixtures/');
      // foreach($html->find('a') as $element)
      //  echo $element->href . '<br>';
      // $html = file_get_html('http://www.oddsportal.com/soccer/england/premier-league/');
      // foreach($html->find('td') as $element)
      //  echo $element->xparam . '<br>';
    ?>

    <table>
      <tr>
        <th>Team 1</th>
        <th>1</th>
        <th>X</th>
        <th>2</th>
        <th>Team 2</th>
        <th>Date</th>
        <th>Time</th>
      </tr>
      <?php
        for ($i=0; $i < count($oddsf); $i++) {
          echo "<tr>
            <td>", $oddsf[$i][3] ,"</td>
            <td>", $oddsf[$i][0] ,"</td>
            <td>", $oddsf[$i][1] ,"</td>
            <td>", $oddsf[$i][2] ,"</td>
            <td>", $oddsf[$i][4] ,"</td>
            <td>", $oddsf[$i][5] ,"</td>
            <td>", $oddsf[$i][6] ,"</td>
          </tr>";
        }
      ?>
    </table>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
  </body>
</html>
