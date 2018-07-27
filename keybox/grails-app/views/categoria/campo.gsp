<%--
  Created by IntelliJ IDEA.
  User: gargui3
  Date: 11/10/15
  Time: 03:42 PM
--%>

<div class="form-group">
    <label class="control-label col-md-2">Campo</label>
    <div class="col-md-7">
        <input name="nombreCampo" class="form-control" placeholder="Nombre del campo" type="text" required>
    </div>
</div>
<div class="form-group">
    <label class="control-label col-md-2">Tipo Campo</label>
    <div class="col-md-7">
        <select name="valor" class="form-control" id="campoE">
            <option value="0">-- Selecciona uno --</option>
            <option value="Texto">Texto</option>
            <option value="Area de Texto">Área de texto</option>
            <option value="Numero">Número</option>
            <option value="Correo">Correo Electrónico</option>
            <option value="Fecha">Fecha</option>
            <option value="Archivo">Archivo</option>
        </select>
    </div>
</div>

<div class="line line-dashed line-lg pull-in"></div>