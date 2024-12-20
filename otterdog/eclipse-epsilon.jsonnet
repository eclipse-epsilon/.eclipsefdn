local orgs = import 'vendor/otterdog-defaults/otterdog-defaults.libsonnet';

orgs.newOrg('modeling.epsilon', 'eclipse-epsilon') {
  settings+: {
    description: "",
    name: "Eclipse Epsilon",
    web_commit_signoff_required: false,
    workflows+: {
      actions_can_approve_pull_request_reviews: false,
    },
  },
  webhooks+: [
    orgs.newOrgWebhook('https://ci.eclipse.org/epsilon/github-webhook/') {
      content_type: "json",
      events+: [
        "pull_request",
        "push"
      ],
    },
  ],
  _repositories+:: [
    orgs.newRepo('epsilon') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      description: "Epsilon is a family of Java-based scripting languages for automating common model-based software engineering tasks, such as code generation, model-to-model transformation and model validation, that work out of the box with EMF (including Xtext and Sirius), UML (including Cameo/MagicDraw), Simulink, XML and other types of models.",
      has_discussions: true,
      homepage: "https://eclipse.org/epsilon",
      topics+: [
        "domain-specific-languages",
        "model-based-software-engineering",
        "model-driven-engineering"
      ],
      web_commit_signoff_required: false,
      workflows+: {
        default_workflow_permissions: "write",
      },
    },
    orgs.newRepo('epsilon-website') {
      allow_merge_commit: true,
      allow_update_branch: false,
      delete_branch_on_merge: false,
      web_commit_signoff_required: false,
      workflows+: {
        enabled: true,
      },
    },
  ],
} + {
  # snippet added due to 'https://github.com/EclipseFdn/otterdog-configs/blob/main/blueprints/add-dot-github-repo.yml'
  _repositories+:: [
    orgs.newRepo('.github')
  ],
}