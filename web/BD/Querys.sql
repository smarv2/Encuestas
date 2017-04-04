/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  MXI01020253A
 * Created: 4/04/2017
 */

ALTER DATABASE encuesta DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci; 
ALTER TABLE encuesta COLLATE=utf8_general_ci;
ALTER TABLE opcion COLLATE=utf8_general_ci;
ALTER TABLE pregunta COLLATE=utf8_general_ci;
ALTER TABLE usuarios COLLATE=utf8_general_ci;