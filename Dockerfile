FROM vitess/lite
RUN mkdir -p $VTDATAROOT/tmp
RUN chown -R vitess /vt

EXPOSE 15000
EXPOSE 15999

USER vitess

ENTRYPOINT ["su","-p","-c","/vt/bin/vtctld","-web_dir","$VTTOP/web/vtctld","-log_dir","$VTDATAROOT/tmp","-alsologtostderr","-port","15000","-grpc_port","15999","-service_map","'grpc-vtctl'","-topo_implementation","etcd","-tablet_protocol","grpc","-tablet_manager_protocol","grpc","-etcd_global_addrs","http://192.168.136.2:4001","vitess"]
