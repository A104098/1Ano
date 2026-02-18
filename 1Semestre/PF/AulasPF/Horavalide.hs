type Hora = (Int,Int)
horavalide :: Hora -> Bool
horavalide (h,m) = if (h>=0) && (h<24) && (m>=0) && (m<60) then True
else False