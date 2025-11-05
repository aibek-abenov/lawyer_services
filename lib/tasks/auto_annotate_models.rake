# NOTE: only doing this in development as some production environments (Heroku)
# NOTE: are sensitive to local FS writes, and besides -- it's just not proper
# NOTE: to have a dev-mode tool do its thing in production.
if Rails.env.development?
  task :set_annotation_options do
    # You can override any of these by setting an environment variable of the
    # same name.
    Annotate.set_defaults(
      'position_in_class' => 'after',
      'show_indexes' => 'true',
      'show_foreign_keys' => 'true',
      'simple_indexes' => 'false',
      'include_version' => 'false',
      'require' => '',
      'model_dir' => 'app/models, app/models/user.rb',
      'root_dir' => '',
      'with_comment' => 'true',

      'exclude_tests' => 'true',
      'exclude_fixtures' => 'true',
      'exclude_factories' => 'true',
      'exclude_serializers' => 'true',
      'exclude_helpers' => 'true',
      'exclude_controllers' => 'true',
      'exclude_mailers' => 'true',
      'exclude_jobs' => 'true',
      'exclude_scaffolds' => 'true',
      'exclude_validators' => 'true'
    )
  end

  Annotate.load_tasks
end
