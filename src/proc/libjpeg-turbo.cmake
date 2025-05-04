function(setup_libjpeg_turbo)
    set(LIBJPEG_TURBO_INSTALL_DIR ${CMAKE_BINARY_DIR}/libjpeg-turbo)

    include(ExternalProject)
    ExternalProject_Add(libjpeg-turbo
        PREFIX libjpeg-turbo
        GIT_REPOSITORY "https://github.com/libjpeg-turbo/libjpeg-turbo.git"
        GIT_TAG "main"
        SOURCE_DIR "${CMAKE_BINARY_DIR}/third-party/libjpeg-turbo"
        INSTALL_DIR ${LIBJPEG_TURBO_INSTALL_DIR}
        CMAKE_ARGS
            -DCMAKE_INSTALL_PREFIX=${LIBJPEG_TURBO_INSTALL_DIR}
            -DCMAKE_POSITION_INDEPENDENT_CODE=ON
            -DENABLE_SHARED=OFF
            -DENABLE_STATIC=ON
    )

    # Propagate to parent scope
    set(LIBJPEG_TURBO_INCLUDE_DIR "${LIBJPEG_TURBO_INSTALL_DIR}/include" PARENT_SCOPE)
    set(LIBJPEG_TURBO_LIBRARY "${LIBJPEG_TURBO_INSTALL_DIR}/lib/turbojpeg.lib" PARENT_SCOPE)
endfunction()
