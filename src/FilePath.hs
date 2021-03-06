module FilePath where
import qualified System.Directory as D

checkPath :: Bool -> FilePath -> String -> IO (Maybe String) 
checkPath dir path name = do 
  exists <- predicate path 
  return $
    if exists then Nothing else Just $
    "missing " ++ path_type ++ " of " ++ name
  where 
    (predicate, path_type) =
      if dir then (D.doesDirectoryExist, "dir") else (D.doesFileExist, "file")

checkDir :: FilePath -> String -> IO (Maybe String)
checkDir = checkPath True  

checkFile :: FilePath -> String -> IO (Maybe String)
checkFile = checkPath False  
