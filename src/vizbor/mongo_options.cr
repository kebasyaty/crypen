# Mongo Driver Options.
module Vizbor::MongoOptions
  extend self

  alias MongoDriverOptions = NamedTuple(
    uri: String,
    options: NamedTuple(
      appname: String?,
      auth_mechanism: String?,
      auth_mechanism_properties: String?,
      auth_source: String?,
      compressors: String?,
      connect_timeout: Time::Span?, # 10.seconds
      direct_connection: Bool?,
      heartbeat_frequency: Time::Span,
      journal: Bool?,
      local_threshold: Time::Span,
      max_idle_time: Time::Span?,
      max_pool_size: Int32,
      max_staleness_seconds: Int32?,
      min_pool_size: Int32,
      read_concern_level: String?,
      read_preference: String?,
      read_preference_tags: Array(String),
      replica_set: String?,
      retry_reads: Bool?,
      retry_writes: Bool?,
      server_selection_timeout: Time::Span,
      server_selection_try_once: Bool,
      socket_timeout: Time::Span?,
      ssl: Bool?,
      tls: Bool?,
      tls_allow_invalid_certificates: Bool?,
      tls_allow_invalid_hostnames: Bool?,
      tls_ca_file: String?,
      tls_certificate_key_file: String?,
      tls_certificate_key_file_password: String?,
      tls_disable_certificate_revocation_check: Bool?,
      tls_disable_ocsp_endpoint_check: Bool?,
      tls_insecure: Bool?,
      w: (Int32 | String)?,
      wait_queue_timeout: Time::Span?,
      w_timeout: Time::Span?,
      zlib_compression_level: Int32?,
    ))

  def mongo_options : MongoDriverOptions
    yaml : String = File.read("config/mongo/options.yml")
    MongoDriverOptions.from_yaml(yaml)
  end
end
