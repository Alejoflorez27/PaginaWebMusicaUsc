  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Proyecto WEB
      </h1>
      <ol class="breadcrumb">
        <li><a href="inicio"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">User profile</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <div class="row">
        <div class="col-md-3">

          <!-- Profile Image -->
          <div class="box box-danger">
            <div class="box-body box-profile">
              <?php echo '<img src="'.$_SESSION["foto"].'" class="profile-user-img img-responsive img-circle" alt="User profile picture">'; ?>
              
              
              <h3 class="profile-username text-center"><?php  echo $_SESSION["nombre"]; ?></h3>

              <p class="text-muted text-center">Software Engineer</p>

              <ul class="list-group list-group-unbordered">
                <li class="list-group-item">
                  <b>Followers</b> <a class="pull-right">1,322</a>
                </li>
                <li class="list-group-item">
                  <b>Following</b> <a class="pull-right">543</a>
                </li>
                <li class="list-group-item">
                  <b>Friends</b> <a class="pull-right">13,287</a>
                </li>
              </ul>

              <a href="#" class="btn btn-danger btn-block"><b>Follow</b></a>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          <!-- About Me Box -->
          <div class="box box-danger">
            <div class="box-header with-border">
              <h3 class="box-title">Nosotros</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <strong><i class="fa fa-book margin-r-5"></i> Education</strong>

              <p class="text-muted">
                Universidad Santiago de Cali <br>
                <a class="btn btn-social-icon btn-github" href="https://github.com/Alejoflorez27/PaginaMusicaUSC_FINAL"><i class="fa fa-github"></i></a>
              </p>

              <hr>

              <strong><i class="fa fa-map-marker margin-r-5"></i> Location</strong>

              <p class="text-muted">Cali, Valle del Cauca</p>

              <hr>

              <strong><i class="fa fa-pencil margin-r-5"></i> Skills</strong>

              <p>
                <span class="label label-danger">UI Design</span>
                <span class="label label-success">Coding</span>
                <span class="label label-info">Javascript</span>
                <span class="label label-warning">PHP</span>
                <span class="label label-primary">Node.js</span>
              </p>

              <hr>

              <strong><i class="fa fa-file-text-o margin-r-5"></i> Notes</strong>

              <p>Deja volar tu Creatividad</p>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
        <div class="col-md-9">
          <div class="nav-tabs-custom">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#activity" data-toggle="tab">Inicio</a></li>
              <li><a href="#timeline" data-toggle="tab">Canciones</a></li>
              <li><a href="#settings" data-toggle="tab">Albunes</a></li>
              <li><a href="#Artistas" data-toggle="tab">Artistas</a></li>
            </ul>
            <div class="tab-content">
              <div class="active tab-pane" id="activity">
                  <h1>Playlist</h1>
                  <?php include "reproductor.php" ?>
              </div>
              <!-- /.tab-pane -->
              <div class="tab-pane" id="timeline">
  <!--Seccion en la cual va a ver un boton de agregar una categoría el cual utiliza un modal--> 
  <section class="content">

   <div class="box">
    <div class="box-body">
    <h1>Lista de Canciones</h1>
      <table class="table table-bordered table-striped dt-responsive tablas" width="100%">
        
        <thead>
          
          <tr>
            
            <th style="width: 10px">#</th>
            <th>Canciones</th>
            <th>Descripción</th>
            <th>Año</th>
            <th>Genero</th>
            <th>Album</th>
            

          </tr>

        </thead>

        <tbody>

        <?php

          $item = null;
          $valor = null;

          //La siguiente variable solicita ya se mostrar un canciones o varias
          $canciones = ControladorCanciones::ctrMostrarCanciones($item, $valor);

          //Para revisar que trae categorias
          //var_dump($canciones);

          //El foreach lo hacemos devido a que existe un array
          foreach ($canciones as $key => $value) {
            
            echo '<tr>
            
                    <td>'.($key+1).'</td>

                    <td class="text-uppercase">'.$value["nom_cancion"].'</td>
                    <td class="text-uppercase">'.$value["descripcion"].'</td>
                    <td class="text-uppercase">'.$value["ano"].'</td>';

                    $item = "id";
                    $valor = $value["id_genero"];

                    //Solicitamos una respuesta de la categoria reciclado metodos
                    $genero = ControladorCategorias::ctrMostrarCategorias($item, $valor);

                    echo '<td class="text-uppercase">'.$genero["nom_genero"].'</td>';

                    $item = "id";
                    $valor = $value["id_album"];

                    //Solicitamos una respuesta de la categoria reciclado metodos
                    $album = ControladorAlbunes::ctrMostrarAlbunes($item, $valor);

                    echo '<td class="text-uppercase">'.$album["nom_album"].'</td>                    


                  </tr>';

          }


        ?>

        </tbody>

      </table>

    </div>

  </div>

</section>
              </div>
              <!-- /.tab-pane -->

              <div class="tab-pane" id="settings">
  <!--Seccion en la cual va a ver un boton de agregar una categoría el cual utiliza un modal--> 
  <section class="content">

   <div class="box">

   <h1>Lista de Albunes</h1>

    <div class="box-body">
      
      <table class="table table-bordered table-striped dt-responsive tablas" width="100%">
        
        <thead>
          
          <tr>
            
            <th style="width: 10px">#</th>
            <th>Album</th>
            <th>Descripción</th>
            <th>Año</th>

          </tr>

        </thead>

        <tbody>

        <?php

          $item = null;
          $valor = null;

          //La siguiente variable solicita ya se mostrar un categoria o varias
          $albunes = ControladorAlbunes::ctrMostrarAlbunes($item, $valor);

          //Para revisar que trae categorias
          //var_dump($categorias);

          //El foreach lo hacemos devido a que existe un array
          foreach ($albunes as $key => $value) {
            
            echo '<tr>
            
                    <td>'.($key+1).'</td>

                    <td class="text-uppercase">'.$value["nom_album"].'</td>
                    <td class="text-uppercase">'.$value["descripcion"].'</td>
                    <td class="text-uppercase">'.$value["ano"].'</td>



                  </tr>';

          }


        ?>

        </tbody>

      </table>

    </div>

  </div>

</section>
              </div>
              <!-- /.tab-pane -->

              <!-- /.tab-pane -->
              <div class="tab-pane" id="Artistas">

  <!--Seccion en la cual va a ver un boton de agregar una categoría el cual utiliza un modal--> 
  <section class="content">

   <div class="box">
    <h1>Lista de Artistas</h1>

    <div class="box-body">
      
      <table class="table table-bordered table-striped dt-responsive tablas" width="100%">
        
        <thead>
          
          <tr>
            
            <th style="width: 10px">#</th>
            <th>Artista</th>
            <th>Edad</th>
            <th>Biografia</th>
            <th>Acciones</th>

          </tr>

        </thead>

        <tbody>

        <?php

          $item = null;
          $valor = null;

          //La siguiente variable solicita ya se mostrar un categoria o varias
          $artistas = ControladorArtistas::ctrMostrarArtistas($item, $valor);

          //Para revisar que trae artistas
          //var_dump($artistas);

          //El foreach lo hacemos devido a que existe un array
          foreach ($artistas as $key => $value) {
            
            echo '<tr>
            
                    <td>'.($key+1).'</td>

                    <td class="text-uppercase">'.$value["nombre_art"].'</td>
                    <td class="text-uppercase">'.$value["edad"].'</td>
                    <td class="text-uppercase">'.$value["biografia"].'</td>

                  </tr>';

          }


        ?>

        </tbody>

      </table>

    </div>

  </div>

</section>              
                
              </div>
            </div>
            <!-- /.tab-content -->
          </div>
          <!-- /.nav-tabs-custom -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->

    </section>
    <!-- /.content -->
  </div>