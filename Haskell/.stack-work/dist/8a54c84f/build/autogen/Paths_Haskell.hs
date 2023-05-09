{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_Haskell (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath



bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "D:\\Learning\\Learning\\Haskell\\.stack-work\\install\\a5460c68\\bin"
libdir     = "D:\\Learning\\Learning\\Haskell\\.stack-work\\install\\a5460c68\\lib\\x86_64-windows-ghc-9.2.7\\Haskell-0.1.0.0-L0PJ4M9HAbAiQ8qRdiQti"
dynlibdir  = "D:\\Learning\\Learning\\Haskell\\.stack-work\\install\\a5460c68\\lib\\x86_64-windows-ghc-9.2.7"
datadir    = "D:\\Learning\\Learning\\Haskell\\.stack-work\\install\\a5460c68\\share\\x86_64-windows-ghc-9.2.7\\Haskell-0.1.0.0"
libexecdir = "D:\\Learning\\Learning\\Haskell\\.stack-work\\install\\a5460c68\\libexec\\x86_64-windows-ghc-9.2.7\\Haskell-0.1.0.0"
sysconfdir = "D:\\Learning\\Learning\\Haskell\\.stack-work\\install\\a5460c68\\etc"

getBinDir     = catchIO (getEnv "Haskell_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "Haskell_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "Haskell_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "Haskell_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Haskell_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Haskell_sysconfdir") (\_ -> return sysconfdir)




joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '\\'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/' || c == '\\'
