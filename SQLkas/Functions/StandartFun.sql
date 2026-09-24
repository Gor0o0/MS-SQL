DECLARE @DT datetime = GetDate()
DECLARE @DT2 datetime2 = SysDateTime()

SELECT Cast(@DT2 AS varchar),
Try_Convert(varchar, @DT2, 2)
Parse(@DT, 