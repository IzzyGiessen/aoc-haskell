{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_day8 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/izzy/.cabal/bin"
libdir     = "/home/izzy/.cabal/lib/x86_64-linux-ghc-9.0.2/day8-0.1.0.0-inplace-day8"
dynlibdir  = "/home/izzy/.cabal/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/izzy/.cabal/share/x86_64-linux-ghc-9.0.2/day8-0.1.0.0"
libexecdir = "/home/izzy/.cabal/libexec/x86_64-linux-ghc-9.0.2/day8-0.1.0.0"
sysconfdir = "/home/izzy/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "day8_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "day8_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "day8_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "day8_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "day8_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "day8_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
