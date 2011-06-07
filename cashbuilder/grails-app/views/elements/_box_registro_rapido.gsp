	<div class="box_registro">
		<form action="">
			<fieldset>
	            <legend>Registro Rápido</legend>

	            <p>
					<label for="data">Data:</label>
					<input type="text" name="data" class="text">
				</p>

				<div class="span-16">
					<div class="span-10">
						<p>
							<label for="valor">Valor:</label>
							<input type="text" name="valor" class="text">
						</p>
					</div>
				
					<div class="span-6 last">
						<p>
							<label for="natureza">Natureza:</label>
							<select name="natureza" >
				                <option value="">Selecione</option>
				                <option value="D">Débito</option>
				                <option value="C">Crédito</option>
		              		</select>
						</p>
					</div>
				</div>
				
				<div class="span-16">
					<div class="span-8">
						<p>
							<label for="categoria">Categoria:</label>
							<select name="categoria" >
				                <option value="">Selecione</option>
				                <option value="D">Receita</option>
				                <option value="C">Alimentação</option>
		              		</select>
						</p>
		            </div>
		            
		            <div class="span-8 last">
			            <p>
							<label for="subcategoria">Subcategoria:</label>
							<select name="subcategoria" >
				                <option value="">Selecione</option>
				                <option value="D">Salario</option>
				                <option value="C">SuperMercado</option>
		              		</select>
						</p>
					</div>
	            </div>
	            <p>
					<label for="descricao">Descricao:</label>
					<input type="text" name="descricao" class="text">
				</p>
	            
	            
	            <div class="span-5 prepend-11">
	            <p>
					<input type="submit" value="gravar" class="button">
					<input type="submit" value="limpar" class="button">
				</p>
				</div>
            
			</fieldset>
        </form>			
	</div>