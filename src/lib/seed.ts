import type { Subject, Node } from "./types";

// ── Curated launch corpus ────────────────────────────────────────────────
// Unified taxonomy: Subject → Sub-subject → Topic. Generated from the
// Periergia subject taxonomy. This is the STABLE tree (seeded once into
// Supabase — see supabase/seed.sql — and used as the in-memory fallback).

interface NodeSpec {
  title: string;
  summary?: string;
  children?: NodeSpec[];
}

interface SubjectSpec {
  name: string;
  slug: string;
  description: string;
  tree: NodeSpec[];
}

const SUBJECTS: SubjectSpec[] = [
  {
    "name": "Mathematics",
    "slug": "mathematics",
    "description": "",
    "tree": [
      {
        "title": "Arithmetic & Number",
        "children": [
          {
            "title": "place value"
          },
          {
            "title": "fractions"
          },
          {
            "title": "decimals"
          },
          {
            "title": "ratios"
          },
          {
            "title": "percentages"
          },
          {
            "title": "integers"
          },
          {
            "title": "number theory basics"
          },
          {
            "title": "primes"
          }
        ]
      },
      {
        "title": "Algebra",
        "children": [
          {
            "title": "expressions"
          },
          {
            "title": "equations"
          },
          {
            "title": "inequalities"
          },
          {
            "title": "functions"
          },
          {
            "title": "polynomials"
          },
          {
            "title": "quadratics"
          },
          {
            "title": "sequences & series"
          },
          {
            "title": "matrices"
          }
        ]
      },
      {
        "title": "Geometry",
        "children": [
          {
            "title": "shapes"
          },
          {
            "title": "angles"
          },
          {
            "title": "area & volume"
          },
          {
            "title": "coordinate geometry"
          },
          {
            "title": "transformations"
          },
          {
            "title": "vectors"
          },
          {
            "title": "trigonometry"
          }
        ]
      },
      {
        "title": "Calculus",
        "children": [
          {
            "title": "limits"
          },
          {
            "title": "derivatives"
          },
          {
            "title": "integrals"
          },
          {
            "title": "differential equations"
          },
          {
            "title": "multivariable calculus"
          },
          {
            "title": "series"
          }
        ]
      },
      {
        "title": "Probability & Statistics",
        "children": [
          {
            "title": "descriptive stats"
          },
          {
            "title": "distributions"
          },
          {
            "title": "hypothesis testing"
          },
          {
            "title": "regression"
          },
          {
            "title": "Bayesian methods"
          }
        ]
      },
      {
        "title": "Discrete Mathematics",
        "children": [
          {
            "title": "logic"
          },
          {
            "title": "set theory"
          },
          {
            "title": "combinatorics"
          },
          {
            "title": "graph theory"
          },
          {
            "title": "proof techniques"
          }
        ]
      },
      {
        "title": "Applied Mathematics",
        "children": [
          {
            "title": "linear algebra"
          },
          {
            "title": "numerical methods"
          },
          {
            "title": "optimization"
          },
          {
            "title": "mathematical modeling"
          }
        ]
      }
    ]
  },
  {
    "name": "Physics",
    "slug": "physics",
    "description": "",
    "tree": [
      {
        "title": "Classical Mechanics",
        "children": [
          {
            "title": "kinematics"
          },
          {
            "title": "forces"
          },
          {
            "title": "energy"
          },
          {
            "title": "momentum"
          },
          {
            "title": "rotation"
          },
          {
            "title": "gravitation"
          }
        ]
      },
      {
        "title": "Thermodynamics",
        "children": [
          {
            "title": "heat"
          },
          {
            "title": "temperature"
          },
          {
            "title": "laws of thermodynamics"
          },
          {
            "title": "entropy"
          },
          {
            "title": "kinetic theory"
          }
        ]
      },
      {
        "title": "Electromagnetism",
        "children": [
          {
            "title": "electric fields"
          },
          {
            "title": "circuits"
          },
          {
            "title": "magnetism"
          },
          {
            "title": "Maxwell's equations"
          },
          {
            "title": "electromagnetic waves"
          }
        ]
      },
      {
        "title": "Waves & Optics",
        "children": [
          {
            "title": "sound"
          },
          {
            "title": "light"
          },
          {
            "title": "reflection"
          },
          {
            "title": "refraction"
          },
          {
            "title": "interference"
          },
          {
            "title": "lenses"
          }
        ]
      },
      {
        "title": "Modern Physics",
        "children": [
          {
            "title": "special relativity"
          },
          {
            "title": "quantum mechanics"
          },
          {
            "title": "atomic & nuclear physics"
          },
          {
            "title": "particle physics"
          }
        ]
      },
      {
        "title": "Astrophysics & Cosmology",
        "children": [
          {
            "title": "stars"
          },
          {
            "title": "black holes"
          },
          {
            "title": "the Big Bang"
          },
          {
            "title": "dark matter & energy"
          }
        ]
      }
    ]
  },
  {
    "name": "Chemistry",
    "slug": "chemistry",
    "description": "",
    "tree": [
      {
        "title": "General Chemistry",
        "children": [
          {
            "title": "atoms"
          },
          {
            "title": "periodic table"
          },
          {
            "title": "bonding"
          },
          {
            "title": "stoichiometry"
          },
          {
            "title": "states of matter"
          }
        ]
      },
      {
        "title": "Physical Chemistry",
        "children": [
          {
            "title": "thermochemistry"
          },
          {
            "title": "kinetics"
          },
          {
            "title": "equilibrium"
          },
          {
            "title": "electrochemistry"
          },
          {
            "title": "quantum chemistry"
          }
        ]
      },
      {
        "title": "Organic Chemistry",
        "children": [
          {
            "title": "hydrocarbons"
          },
          {
            "title": "functional groups"
          },
          {
            "title": "reactions"
          },
          {
            "title": "polymers"
          },
          {
            "title": "stereochemistry"
          }
        ]
      },
      {
        "title": "Inorganic Chemistry",
        "children": [
          {
            "title": "transition metals"
          },
          {
            "title": "coordination compounds"
          },
          {
            "title": "solid-state chemistry"
          }
        ]
      },
      {
        "title": "Analytical Chemistry",
        "children": [
          {
            "title": "spectroscopy"
          },
          {
            "title": "chromatography"
          },
          {
            "title": "titration"
          },
          {
            "title": "quantitative analysis"
          }
        ]
      },
      {
        "title": "Biochemistry",
        "children": [
          {
            "title": "proteins"
          },
          {
            "title": "enzymes"
          },
          {
            "title": "metabolism"
          },
          {
            "title": "nucleic acids"
          },
          {
            "title": "cellular chemistry"
          }
        ]
      }
    ]
  },
  {
    "name": "Biology",
    "slug": "biology",
    "description": "",
    "tree": [
      {
        "title": "Cell Biology",
        "children": [
          {
            "title": "cell structure"
          },
          {
            "title": "membranes"
          },
          {
            "title": "organelles"
          },
          {
            "title": "cell cycle"
          },
          {
            "title": "transport"
          }
        ]
      },
      {
        "title": "Genetics",
        "children": [
          {
            "title": "DNA"
          },
          {
            "title": "inheritance"
          },
          {
            "title": "gene expression"
          },
          {
            "title": "mutations"
          },
          {
            "title": "genomics"
          },
          {
            "title": "CRISPR"
          }
        ]
      },
      {
        "title": "Human Anatomy & Physiology",
        "children": [
          {
            "title": "organ systems"
          },
          {
            "title": "homeostasis"
          },
          {
            "title": "nervous & endocrine systems"
          }
        ]
      },
      {
        "title": "Ecology",
        "children": [
          {
            "title": "ecosystems"
          },
          {
            "title": "food webs"
          },
          {
            "title": "populations"
          },
          {
            "title": "biodiversity"
          },
          {
            "title": "conservation"
          }
        ]
      },
      {
        "title": "Evolution",
        "children": [
          {
            "title": "natural selection"
          },
          {
            "title": "speciation"
          },
          {
            "title": "phylogenetics"
          },
          {
            "title": "evidence for evolution"
          }
        ]
      },
      {
        "title": "Microbiology",
        "children": [
          {
            "title": "bacteria"
          },
          {
            "title": "viruses"
          },
          {
            "title": "fungi"
          },
          {
            "title": "immunology basics"
          }
        ]
      },
      {
        "title": "Botany",
        "children": [
          {
            "title": "plant structure"
          },
          {
            "title": "photosynthesis"
          },
          {
            "title": "plant reproduction"
          }
        ]
      },
      {
        "title": "Zoology",
        "children": [
          {
            "title": "animal classification"
          },
          {
            "title": "behavior"
          },
          {
            "title": "comparative physiology"
          }
        ]
      }
    ]
  },
  {
    "name": "Earth & Environmental Science",
    "slug": "earth-and-environmental-science",
    "description": "",
    "tree": [
      {
        "title": "Geology",
        "children": [
          {
            "title": "rocks & minerals"
          },
          {
            "title": "plate tectonics"
          },
          {
            "title": "volcanoes"
          },
          {
            "title": "earthquakes"
          },
          {
            "title": "the rock cycle"
          }
        ]
      },
      {
        "title": "Meteorology & Climate",
        "children": [
          {
            "title": "weather systems"
          },
          {
            "title": "atmosphere"
          },
          {
            "title": "climate change"
          },
          {
            "title": "forecasting"
          }
        ]
      },
      {
        "title": "Oceanography",
        "children": [
          {
            "title": "currents"
          },
          {
            "title": "marine ecosystems"
          },
          {
            "title": "tides"
          },
          {
            "title": "ocean chemistry"
          }
        ]
      },
      {
        "title": "Environmental Science",
        "children": [
          {
            "title": "pollution"
          },
          {
            "title": "sustainability"
          },
          {
            "title": "resources"
          },
          {
            "title": "ecological footprint"
          }
        ]
      },
      {
        "title": "Physical Geography",
        "children": [
          {
            "title": "landforms"
          },
          {
            "title": "rivers"
          },
          {
            "title": "glaciers"
          },
          {
            "title": "soils"
          },
          {
            "title": "biomes"
          }
        ]
      }
    ]
  },
  {
    "name": "Astronomy & Space",
    "slug": "astronomy-and-space",
    "description": "",
    "tree": [
      {
        "title": "Solar System",
        "children": [
          {
            "title": "planets"
          },
          {
            "title": "moons"
          },
          {
            "title": "asteroids"
          },
          {
            "title": "comets"
          },
          {
            "title": "the Sun"
          }
        ]
      },
      {
        "title": "Stars & Galaxies",
        "children": [
          {
            "title": "stellar life cycles"
          },
          {
            "title": "nebulae"
          },
          {
            "title": "galaxy types"
          },
          {
            "title": "the Milky Way"
          }
        ]
      },
      {
        "title": "Cosmology",
        "children": [
          {
            "title": "origins of the universe"
          },
          {
            "title": "expansion"
          },
          {
            "title": "dark matter"
          },
          {
            "title": "multiverse theories"
          }
        ]
      },
      {
        "title": "Space Exploration",
        "children": [
          {
            "title": "rockets"
          },
          {
            "title": "satellites"
          },
          {
            "title": "telescopes"
          },
          {
            "title": "crewed missions"
          },
          {
            "title": "astrobiology"
          }
        ]
      }
    ]
  },
  {
    "name": "Computer Science",
    "slug": "computer-science",
    "description": "",
    "tree": [
      {
        "title": "Programming Fundamentals",
        "children": [
          {
            "title": "variables"
          },
          {
            "title": "control flow"
          },
          {
            "title": "functions"
          },
          {
            "title": "data types"
          },
          {
            "title": "debugging"
          }
        ]
      },
      {
        "title": "Data Structures & Algorithms",
        "children": [
          {
            "title": "arrays"
          },
          {
            "title": "trees"
          },
          {
            "title": "graphs"
          },
          {
            "title": "sorting"
          },
          {
            "title": "searching"
          },
          {
            "title": "complexity"
          }
        ]
      },
      {
        "title": "Software Engineering",
        "children": [
          {
            "title": "version control"
          },
          {
            "title": "testing"
          },
          {
            "title": "design patterns"
          },
          {
            "title": "agile methods"
          }
        ]
      },
      {
        "title": "Web Development",
        "children": [
          {
            "title": "HTML/CSS"
          },
          {
            "title": "JavaScript"
          },
          {
            "title": "frontend frameworks"
          },
          {
            "title": "backend"
          },
          {
            "title": "APIs"
          },
          {
            "title": "databases"
          }
        ]
      },
      {
        "title": "Databases",
        "children": [
          {
            "title": "SQL"
          },
          {
            "title": "relational design"
          },
          {
            "title": "NoSQL"
          },
          {
            "title": "data modeling"
          }
        ]
      },
      {
        "title": "Artificial Intelligence & ML",
        "children": [
          {
            "title": "neural networks"
          },
          {
            "title": "supervised/unsupervised learning"
          },
          {
            "title": "LLMs"
          },
          {
            "title": "computer vision"
          }
        ]
      },
      {
        "title": "Cybersecurity",
        "children": [
          {
            "title": "cryptography"
          },
          {
            "title": "network security"
          },
          {
            "title": "ethical hacking"
          },
          {
            "title": "privacy"
          }
        ]
      },
      {
        "title": "Systems & Networks",
        "children": [
          {
            "title": "operating systems"
          },
          {
            "title": "computer architecture"
          },
          {
            "title": "networking"
          },
          {
            "title": "distributed systems"
          }
        ]
      },
      {
        "title": "Theory of Computation",
        "children": [
          {
            "title": "automata"
          },
          {
            "title": "computability"
          },
          {
            "title": "complexity theory"
          }
        ]
      }
    ]
  },
  {
    "name": "Engineering & Technology",
    "slug": "engineering-and-technology",
    "description": "",
    "tree": [
      {
        "title": "Mechanical Engineering",
        "children": [
          {
            "title": "statics"
          },
          {
            "title": "dynamics"
          },
          {
            "title": "materials"
          },
          {
            "title": "thermodynamics"
          },
          {
            "title": "machine design"
          }
        ]
      },
      {
        "title": "Electrical Engineering",
        "children": [
          {
            "title": "circuits"
          },
          {
            "title": "signals"
          },
          {
            "title": "control systems"
          },
          {
            "title": "power"
          },
          {
            "title": "electronics"
          }
        ]
      },
      {
        "title": "Civil Engineering",
        "children": [
          {
            "title": "structures"
          },
          {
            "title": "materials"
          },
          {
            "title": "geotechnics"
          },
          {
            "title": "transportation"
          },
          {
            "title": "water systems"
          }
        ]
      },
      {
        "title": "Chemical Engineering",
        "children": [
          {
            "title": "reactions"
          },
          {
            "title": "process design"
          },
          {
            "title": "transport phenomena"
          }
        ]
      },
      {
        "title": "Aerospace Engineering",
        "children": [
          {
            "title": "aerodynamics"
          },
          {
            "title": "propulsion"
          },
          {
            "title": "flight mechanics"
          }
        ]
      },
      {
        "title": "Biomedical Engineering",
        "children": [
          {
            "title": "medical devices"
          },
          {
            "title": "biomechanics"
          },
          {
            "title": "imaging"
          }
        ]
      },
      {
        "title": "Robotics & Mechatronics",
        "children": [
          {
            "title": "sensors"
          },
          {
            "title": "actuators"
          },
          {
            "title": "control"
          },
          {
            "title": "automation"
          }
        ]
      },
      {
        "title": "Industrial & Manufacturing",
        "children": [
          {
            "title": "production systems"
          },
          {
            "title": "quality"
          },
          {
            "title": "logistics"
          },
          {
            "title": "operations"
          }
        ]
      }
    ]
  },
  {
    "name": "Medicine & Health",
    "slug": "medicine-and-health",
    "description": "",
    "tree": [
      {
        "title": "Human Body & Physiology",
        "children": [
          {
            "title": "organ systems"
          },
          {
            "title": "homeostasis"
          },
          {
            "title": "biomechanics"
          }
        ]
      },
      {
        "title": "Anatomy",
        "children": [
          {
            "title": "musculoskeletal"
          },
          {
            "title": "cardiovascular"
          },
          {
            "title": "nervous"
          },
          {
            "title": "digestive systems"
          }
        ]
      },
      {
        "title": "Nutrition & Dietetics",
        "children": [
          {
            "title": "macronutrients"
          },
          {
            "title": "metabolism"
          },
          {
            "title": "dietary planning"
          }
        ]
      },
      {
        "title": "Pharmacology",
        "children": [
          {
            "title": "drug action"
          },
          {
            "title": "dosage"
          },
          {
            "title": "interactions"
          },
          {
            "title": "classes of medication"
          }
        ]
      },
      {
        "title": "Pathology & Disease",
        "children": [
          {
            "title": "infections"
          },
          {
            "title": "chronic diseases"
          },
          {
            "title": "diagnostics"
          }
        ]
      },
      {
        "title": "Mental Health",
        "children": [
          {
            "title": "disorders"
          },
          {
            "title": "therapy approaches"
          },
          {
            "title": "wellbeing"
          }
        ]
      },
      {
        "title": "Public Health & Epidemiology",
        "children": [
          {
            "title": "disease spread"
          },
          {
            "title": "prevention"
          },
          {
            "title": "health policy"
          }
        ]
      },
      {
        "title": "First Aid & Clinical Skills",
        "children": [
          {
            "title": "emergency response"
          },
          {
            "title": "patient care basics"
          }
        ]
      }
    ]
  },
  {
    "name": "Psychology",
    "slug": "psychology",
    "description": "",
    "tree": [
      {
        "title": "Cognitive Psychology",
        "children": [
          {
            "title": "memory"
          },
          {
            "title": "attention"
          },
          {
            "title": "perception"
          },
          {
            "title": "decision-making"
          }
        ]
      },
      {
        "title": "Developmental Psychology",
        "children": [
          {
            "title": "childhood"
          },
          {
            "title": "adolescence"
          },
          {
            "title": "aging"
          },
          {
            "title": "attachment"
          }
        ]
      },
      {
        "title": "Social Psychology",
        "children": [
          {
            "title": "attitudes"
          },
          {
            "title": "groups"
          },
          {
            "title": "persuasion"
          },
          {
            "title": "prejudice"
          }
        ]
      },
      {
        "title": "Clinical & Abnormal Psychology",
        "children": [
          {
            "title": "disorders"
          },
          {
            "title": "diagnosis"
          },
          {
            "title": "treatment"
          }
        ]
      },
      {
        "title": "Biological Psychology",
        "children": [
          {
            "title": "brain"
          },
          {
            "title": "neurons"
          },
          {
            "title": "hormones"
          },
          {
            "title": "behavior"
          }
        ]
      },
      {
        "title": "Behavioral Psychology",
        "children": [
          {
            "title": "conditioning"
          },
          {
            "title": "reinforcement"
          },
          {
            "title": "learning theory"
          }
        ]
      },
      {
        "title": "Personality & Individual Differences",
        "children": [
          {
            "title": "traits"
          },
          {
            "title": "intelligence"
          },
          {
            "title": "motivation"
          }
        ]
      }
    ]
  },
  {
    "name": "Sociology & Anthropology",
    "slug": "sociology-and-anthropology",
    "description": "",
    "tree": [
      {
        "title": "Sociological Theory",
        "children": [
          {
            "title": "classical & modern thinkers"
          },
          {
            "title": "key frameworks"
          }
        ]
      },
      {
        "title": "Social Structures",
        "children": [
          {
            "title": "class"
          },
          {
            "title": "family"
          },
          {
            "title": "institutions"
          },
          {
            "title": "inequality"
          }
        ]
      },
      {
        "title": "Culture & Society",
        "children": [
          {
            "title": "norms"
          },
          {
            "title": "values"
          },
          {
            "title": "socialization"
          },
          {
            "title": "subcultures"
          }
        ]
      },
      {
        "title": "Cultural Anthropology",
        "children": [
          {
            "title": "ethnography"
          },
          {
            "title": "kinship"
          },
          {
            "title": "ritual"
          },
          {
            "title": "belief systems"
          }
        ]
      },
      {
        "title": "Archaeology",
        "children": [
          {
            "title": "human origins"
          },
          {
            "title": "artifacts"
          },
          {
            "title": "ancient civilizations"
          }
        ]
      },
      {
        "title": "Social Research Methods",
        "children": [
          {
            "title": "surveys"
          },
          {
            "title": "interviews"
          },
          {
            "title": "qualitative & quantitative analysis"
          }
        ]
      }
    ]
  },
  {
    "name": "Political Science & International Relations",
    "slug": "political-science-and-international-relations",
    "description": "",
    "tree": [
      {
        "title": "Political Theory",
        "children": [
          {
            "title": "democracy"
          },
          {
            "title": "power"
          },
          {
            "title": "justice"
          },
          {
            "title": "ideologies"
          }
        ]
      },
      {
        "title": "Comparative Politics",
        "children": [
          {
            "title": "political systems"
          },
          {
            "title": "elections"
          },
          {
            "title": "institutions"
          }
        ]
      },
      {
        "title": "International Relations",
        "children": [
          {
            "title": "diplomacy"
          },
          {
            "title": "war & peace"
          },
          {
            "title": "global governance"
          }
        ]
      },
      {
        "title": "Public Policy",
        "children": [
          {
            "title": "policy-making"
          },
          {
            "title": "governance"
          },
          {
            "title": "administration"
          }
        ]
      },
      {
        "title": "Geopolitics",
        "children": [
          {
            "title": "borders"
          },
          {
            "title": "resources"
          },
          {
            "title": "regional power"
          },
          {
            "title": "security"
          }
        ]
      }
    ]
  },
  {
    "name": "Economics",
    "slug": "economics",
    "description": "",
    "tree": [
      {
        "title": "Microeconomics",
        "children": [
          {
            "title": "supply & demand"
          },
          {
            "title": "elasticity"
          },
          {
            "title": "consumer choice"
          },
          {
            "title": "production & costs"
          },
          {
            "title": "breakeven & shutdown"
          },
          {
            "title": "surplus & market interventions"
          },
          {
            "title": "factor markets"
          },
          {
            "title": "market failure & government"
          }
        ]
      },
      {
        "title": "Firms & Market Structures",
        "children": [
          {
            "title": "perfect competition"
          },
          {
            "title": "monopolistic competition"
          },
          {
            "title": "oligopoly"
          },
          {
            "title": "monopoly"
          },
          {
            "title": "economies of scale"
          },
          {
            "title": "measuring market power"
          }
        ]
      },
      {
        "title": "Macroeconomics",
        "children": [
          {
            "title": "GDP & national accounts"
          },
          {
            "title": "aggregate demand & supply"
          },
          {
            "title": "economic growth"
          },
          {
            "title": "inflation"
          },
          {
            "title": "unemployment"
          },
          {
            "title": "Keynesian economics & IS-LM"
          },
          {
            "title": "current economic issues"
          }
        ]
      },
      {
        "title": "Business Cycles",
        "children": [
          {
            "title": "phases of the cycle"
          },
          {
            "title": "credit cycles"
          },
          {
            "title": "economic indicators"
          },
          {
            "title": "recessions & recoveries"
          }
        ]
      },
      {
        "title": "Money & Policy",
        "children": [
          {
            "title": "money & banking"
          },
          {
            "title": "central banks"
          },
          {
            "title": "monetary policy"
          },
          {
            "title": "fiscal policy"
          },
          {
            "title": "interest rates"
          },
          {
            "title": "stabilization policies & their limits"
          }
        ]
      },
      {
        "title": "Finance & Capital Markets",
        "children": [
          {
            "title": "stocks & bonds"
          },
          {
            "title": "funds & investment vehicles"
          },
          {
            "title": "derivatives"
          },
          {
            "title": "financial statements"
          },
          {
            "title": "housing & mortgages"
          }
        ]
      },
      {
        "title": "Global Economy",
        "children": [
          {
            "title": "international trade"
          },
          {
            "title": "trade restrictions & blocs"
          },
          {
            "title": "capital flows & balance of payments"
          },
          {
            "title": "exchange rates"
          },
          {
            "title": "geopolitics & markets"
          }
        ]
      },
      {
        "title": "Quantitative Foundations",
        "children": [
          {
            "title": "time value of money"
          },
          {
            "title": "rates & returns",
            "summary": "How investment performance is measured: holding period return, mean returns, money- vs time-weighted returns, and adjusting for inflation, taxes, and leverage.",
            "children": [
              {
                "title": "holding period return"
              },
              {
                "title": "arithmetic & geometric mean return"
              },
              {
                "title": "money-weighted return (IRR)"
              },
              {
                "title": "time-weighted return"
              },
              {
                "title": "annualized returns"
              },
              {
                "title": "real, nominal & after-tax returns"
              },
              {
                "title": "leveraged returns"
              }
            ]
          },
          {
            "title": "statistical measures of returns"
          },
          {
            "title": "probability & expected value"
          },
          {
            "title": "portfolio mathematics"
          }
        ]
      },
      {
        "title": "Statistical Methods",
        "children": [
          {
            "title": "sampling & estimation"
          },
          {
            "title": "hypothesis testing"
          },
          {
            "title": "regression"
          },
          {
            "title": "simulation methods"
          },
          {
            "title": "big data techniques"
          }
        ]
      },
      {
        "title": "Behavioral Economics",
        "children": [
          {
            "title": "decision-making"
          },
          {
            "title": "biases"
          },
          {
            "title": "incentives"
          }
        ]
      },
      {
        "title": "Development Economics",
        "children": [
          {
            "title": "growth"
          },
          {
            "title": "poverty"
          },
          {
            "title": "inequality"
          }
        ]
      }
    ]
  },
  {
    "name": "Business & Management",
    "slug": "business-and-management",
    "description": "",
    "tree": [
      {
        "title": "Management",
        "children": [
          {
            "title": "leadership"
          },
          {
            "title": "organizational behavior"
          },
          {
            "title": "strategy"
          },
          {
            "title": "operations"
          }
        ]
      },
      {
        "title": "Marketing",
        "children": [
          {
            "title": "branding"
          },
          {
            "title": "consumer behavior"
          },
          {
            "title": "digital marketing"
          },
          {
            "title": "market research"
          }
        ]
      },
      {
        "title": "Accounting",
        "children": [
          {
            "title": "financial statements"
          },
          {
            "title": "bookkeeping"
          },
          {
            "title": "auditing"
          },
          {
            "title": "managerial accounting"
          }
        ]
      },
      {
        "title": "Finance",
        "children": [
          {
            "title": "investment"
          },
          {
            "title": "valuation"
          },
          {
            "title": "corporate finance"
          },
          {
            "title": "markets"
          },
          {
            "title": "risk"
          }
        ]
      },
      {
        "title": "Entrepreneurship",
        "children": [
          {
            "title": "startups"
          },
          {
            "title": "business models"
          },
          {
            "title": "funding"
          },
          {
            "title": "product-market fit"
          }
        ]
      },
      {
        "title": "Human Resources",
        "children": [
          {
            "title": "recruitment"
          },
          {
            "title": "training"
          },
          {
            "title": "compensation"
          },
          {
            "title": "workplace culture"
          }
        ]
      },
      {
        "title": "Project Management",
        "children": [
          {
            "title": "planning"
          },
          {
            "title": "scheduling"
          },
          {
            "title": "agile"
          },
          {
            "title": "risk management"
          }
        ]
      }
    ]
  },
  {
    "name": "Law",
    "slug": "law",
    "description": "",
    "tree": [
      {
        "title": "Legal Systems",
        "children": [
          {
            "title": "common law"
          },
          {
            "title": "civil law"
          },
          {
            "title": "sources of law"
          },
          {
            "title": "courts"
          }
        ]
      },
      {
        "title": "Constitutional Law",
        "children": [
          {
            "title": "rights"
          },
          {
            "title": "government structure"
          },
          {
            "title": "judicial review"
          }
        ]
      },
      {
        "title": "Criminal Law",
        "children": [
          {
            "title": "offenses"
          },
          {
            "title": "defenses"
          },
          {
            "title": "procedure"
          },
          {
            "title": "evidence"
          }
        ]
      },
      {
        "title": "Civil Law",
        "children": [
          {
            "title": "contracts"
          },
          {
            "title": "torts"
          },
          {
            "title": "property"
          },
          {
            "title": "family law"
          }
        ]
      },
      {
        "title": "International Law",
        "children": [
          {
            "title": "treaties"
          },
          {
            "title": "human rights"
          },
          {
            "title": "humanitarian law"
          }
        ]
      },
      {
        "title": "Business & Commercial Law",
        "children": [
          {
            "title": "company law"
          },
          {
            "title": "intellectual property"
          },
          {
            "title": "employment"
          }
        ]
      }
    ]
  },
  {
    "name": "History",
    "slug": "history",
    "description": "",
    "tree": [
      {
        "title": "Ancient History",
        "children": [
          {
            "title": "Mesopotamia"
          },
          {
            "title": "Egypt"
          },
          {
            "title": "Greece"
          },
          {
            "title": "Rome"
          },
          {
            "title": "early civilizations"
          }
        ]
      },
      {
        "title": "Medieval History",
        "children": [
          {
            "title": "feudalism"
          },
          {
            "title": "empires"
          },
          {
            "title": "the Middle Ages"
          },
          {
            "title": "Islamic golden age"
          }
        ]
      },
      {
        "title": "Early Modern History",
        "children": [
          {
            "title": "Renaissance"
          },
          {
            "title": "exploration"
          },
          {
            "title": "revolutions"
          },
          {
            "title": "Enlightenment"
          }
        ]
      },
      {
        "title": "Modern History",
        "children": [
          {
            "title": "industrialization"
          },
          {
            "title": "world wars"
          },
          {
            "title": "Cold War"
          },
          {
            "title": "decolonization"
          }
        ]
      },
      {
        "title": "Regional Histories",
        "children": [
          {
            "title": "Europe"
          },
          {
            "title": "Asia"
          },
          {
            "title": "Africa"
          },
          {
            "title": "Americas"
          },
          {
            "title": "Middle East"
          }
        ]
      },
      {
        "title": "Thematic History",
        "children": [
          {
            "title": "economic"
          },
          {
            "title": "social"
          },
          {
            "title": "military"
          },
          {
            "title": "intellectual history"
          }
        ]
      }
    ]
  },
  {
    "name": "Geography",
    "slug": "geography",
    "description": "",
    "tree": [
      {
        "title": "Physical Geography",
        "children": [
          {
            "title": "landforms"
          },
          {
            "title": "climate"
          },
          {
            "title": "ecosystems"
          },
          {
            "title": "hydrology"
          }
        ]
      },
      {
        "title": "Human Geography",
        "children": [
          {
            "title": "population"
          },
          {
            "title": "migration"
          },
          {
            "title": "urbanization"
          },
          {
            "title": "culture"
          }
        ]
      },
      {
        "title": "Economic Geography",
        "children": [
          {
            "title": "resources"
          },
          {
            "title": "trade"
          },
          {
            "title": "development"
          },
          {
            "title": "globalization"
          }
        ]
      },
      {
        "title": "Cartography & GIS",
        "children": [
          {
            "title": "maps"
          },
          {
            "title": "spatial data"
          },
          {
            "title": "remote sensing"
          }
        ]
      },
      {
        "title": "Regional Geography",
        "children": [
          {
            "title": "continents"
          },
          {
            "title": "countries"
          },
          {
            "title": "regional studies"
          }
        ]
      }
    ]
  },
  {
    "name": "Philosophy",
    "slug": "philosophy",
    "description": "",
    "tree": [
      {
        "title": "Logic",
        "children": [
          {
            "title": "arguments"
          },
          {
            "title": "fallacies"
          },
          {
            "title": "formal logic"
          },
          {
            "title": "reasoning"
          }
        ]
      },
      {
        "title": "Ethics",
        "children": [
          {
            "title": "moral theories"
          },
          {
            "title": "applied ethics"
          },
          {
            "title": "metaethics"
          }
        ]
      },
      {
        "title": "Metaphysics",
        "children": [
          {
            "title": "reality"
          },
          {
            "title": "existence"
          },
          {
            "title": "free will"
          },
          {
            "title": "mind & body"
          }
        ]
      },
      {
        "title": "Epistemology",
        "children": [
          {
            "title": "knowledge"
          },
          {
            "title": "belief"
          },
          {
            "title": "truth"
          },
          {
            "title": "skepticism"
          }
        ]
      },
      {
        "title": "Political Philosophy",
        "children": [
          {
            "title": "justice"
          },
          {
            "title": "rights"
          },
          {
            "title": "the state"
          },
          {
            "title": "liberty"
          }
        ]
      },
      {
        "title": "History of Philosophy",
        "children": [
          {
            "title": "ancient"
          },
          {
            "title": "medieval"
          },
          {
            "title": "modern"
          },
          {
            "title": "contemporary thinkers"
          }
        ]
      },
      {
        "title": "Aesthetics",
        "children": [
          {
            "title": "beauty"
          },
          {
            "title": "art"
          },
          {
            "title": "taste"
          },
          {
            "title": "interpretation"
          }
        ]
      }
    ]
  },
  {
    "name": "Religion & Theology",
    "slug": "religion-and-theology",
    "description": "",
    "tree": [
      {
        "title": "World Religions",
        "children": [
          {
            "title": "Christianity"
          },
          {
            "title": "Islam"
          },
          {
            "title": "Judaism"
          },
          {
            "title": "Hinduism"
          },
          {
            "title": "Buddhism"
          },
          {
            "title": "others"
          }
        ]
      },
      {
        "title": "Comparative Religion",
        "children": [
          {
            "title": "beliefs"
          },
          {
            "title": "practices"
          },
          {
            "title": "myths across traditions"
          }
        ]
      },
      {
        "title": "Theology",
        "children": [
          {
            "title": "doctrine"
          },
          {
            "title": "scripture"
          },
          {
            "title": "philosophy of religion"
          }
        ]
      },
      {
        "title": "Religious History",
        "children": [
          {
            "title": "origins"
          },
          {
            "title": "movements"
          },
          {
            "title": "reform"
          },
          {
            "title": "secularization"
          }
        ]
      },
      {
        "title": "Ethics & Religion",
        "children": [
          {
            "title": "moral teachings"
          },
          {
            "title": "religious law"
          }
        ]
      }
    ]
  },
  {
    "name": "Languages & Linguistics",
    "slug": "languages-and-linguistics",
    "description": "",
    "tree": [
      {
        "title": "Language Learning",
        "children": [
          {
            "title": "vocabulary"
          },
          {
            "title": "grammar"
          },
          {
            "title": "pronunciation"
          },
          {
            "title": "conversation"
          }
        ]
      },
      {
        "title": "Linguistics",
        "children": [
          {
            "title": "phonetics"
          },
          {
            "title": "syntax"
          },
          {
            "title": "semantics"
          },
          {
            "title": "morphology"
          }
        ]
      },
      {
        "title": "Sociolinguistics",
        "children": [
          {
            "title": "dialects"
          },
          {
            "title": "language & society"
          },
          {
            "title": "multilingualism"
          }
        ]
      },
      {
        "title": "Historical Linguistics",
        "children": [
          {
            "title": "language change"
          },
          {
            "title": "etymology"
          },
          {
            "title": "language families"
          }
        ]
      },
      {
        "title": "Translation & Interpretation",
        "children": [
          {
            "title": "techniques"
          },
          {
            "title": "localization"
          },
          {
            "title": "bilingual skills"
          }
        ]
      }
    ]
  },
  {
    "name": "Literature & Writing",
    "slug": "literature-and-writing",
    "description": "",
    "tree": [
      {
        "title": "Literary Studies",
        "children": [
          {
            "title": "genres"
          },
          {
            "title": "movements"
          },
          {
            "title": "literary analysis"
          },
          {
            "title": "criticism"
          }
        ]
      },
      {
        "title": "World Literature",
        "children": [
          {
            "title": "classics"
          },
          {
            "title": "regional literatures"
          },
          {
            "title": "poetry"
          },
          {
            "title": "drama"
          },
          {
            "title": "fiction"
          }
        ]
      },
      {
        "title": "Creative Writing",
        "children": [
          {
            "title": "fiction"
          },
          {
            "title": "poetry"
          },
          {
            "title": "screenwriting"
          },
          {
            "title": "storytelling craft"
          }
        ]
      },
      {
        "title": "Composition & Rhetoric",
        "children": [
          {
            "title": "essays"
          },
          {
            "title": "argumentation"
          },
          {
            "title": "style"
          },
          {
            "title": "editing"
          }
        ]
      },
      {
        "title": "Journalism",
        "children": [
          {
            "title": "reporting"
          },
          {
            "title": "news writing"
          },
          {
            "title": "interviewing"
          },
          {
            "title": "media ethics"
          }
        ]
      }
    ]
  },
  {
    "name": "Visual Arts",
    "slug": "visual-arts",
    "description": "",
    "tree": [
      {
        "title": "Drawing & Painting",
        "children": [
          {
            "title": "techniques"
          },
          {
            "title": "media"
          },
          {
            "title": "color theory"
          },
          {
            "title": "composition"
          }
        ]
      },
      {
        "title": "Art History",
        "children": [
          {
            "title": "periods"
          },
          {
            "title": "movements"
          },
          {
            "title": "major artists"
          },
          {
            "title": "analysis"
          }
        ]
      },
      {
        "title": "Sculpture & 3D",
        "children": [
          {
            "title": "materials"
          },
          {
            "title": "modeling"
          },
          {
            "title": "installation"
          }
        ]
      },
      {
        "title": "Photography",
        "children": [
          {
            "title": "composition"
          },
          {
            "title": "lighting"
          },
          {
            "title": "editing"
          },
          {
            "title": "genres"
          }
        ]
      },
      {
        "title": "Digital Art",
        "children": [
          {
            "title": "illustration"
          },
          {
            "title": "concept art"
          },
          {
            "title": "digital tools"
          }
        ]
      }
    ]
  },
  {
    "name": "Music",
    "slug": "music",
    "description": "",
    "tree": [
      {
        "title": "Music Theory",
        "children": [
          {
            "title": "notation"
          },
          {
            "title": "scales"
          },
          {
            "title": "harmony"
          },
          {
            "title": "rhythm"
          },
          {
            "title": "composition"
          }
        ]
      },
      {
        "title": "Music History",
        "children": [
          {
            "title": "periods"
          },
          {
            "title": "genres"
          },
          {
            "title": "composers"
          },
          {
            "title": "cultural context"
          }
        ]
      },
      {
        "title": "Instruments & Performance",
        "children": [
          {
            "title": "technique"
          },
          {
            "title": "practice"
          },
          {
            "title": "ensemble playing"
          }
        ]
      },
      {
        "title": "Voice & Singing",
        "children": [
          {
            "title": "technique"
          },
          {
            "title": "range"
          },
          {
            "title": "styles"
          }
        ]
      },
      {
        "title": "Music Production",
        "children": [
          {
            "title": "recording"
          },
          {
            "title": "mixing"
          },
          {
            "title": "electronic music"
          },
          {
            "title": "sound design"
          }
        ]
      }
    ]
  },
  {
    "name": "Performing Arts",
    "slug": "performing-arts",
    "description": "",
    "tree": [
      {
        "title": "Theatre & Drama",
        "children": [
          {
            "title": "acting"
          },
          {
            "title": "directing"
          },
          {
            "title": "playwriting"
          },
          {
            "title": "stagecraft"
          }
        ]
      },
      {
        "title": "Dance",
        "children": [
          {
            "title": "technique"
          },
          {
            "title": "choreography"
          },
          {
            "title": "styles"
          },
          {
            "title": "history"
          }
        ]
      },
      {
        "title": "Film & Television",
        "children": [
          {
            "title": "filmmaking"
          },
          {
            "title": "cinematography"
          },
          {
            "title": "editing"
          },
          {
            "title": "screenwriting"
          }
        ]
      },
      {
        "title": "Performance Studies",
        "children": [
          {
            "title": "improvisation"
          },
          {
            "title": "stage presence"
          },
          {
            "title": "production"
          }
        ]
      }
    ]
  },
  {
    "name": "Design & Architecture",
    "slug": "design-and-architecture",
    "description": "",
    "tree": [
      {
        "title": "Graphic Design",
        "children": [
          {
            "title": "layout"
          },
          {
            "title": "typography"
          },
          {
            "title": "branding"
          },
          {
            "title": "visual communication"
          }
        ]
      },
      {
        "title": "UX/UI Design",
        "children": [
          {
            "title": "user research"
          },
          {
            "title": "wireframing"
          },
          {
            "title": "prototyping"
          },
          {
            "title": "usability"
          }
        ]
      },
      {
        "title": "Product & Industrial Design",
        "children": [
          {
            "title": "form"
          },
          {
            "title": "function"
          },
          {
            "title": "materials"
          },
          {
            "title": "prototyping"
          }
        ]
      },
      {
        "title": "Fashion Design",
        "children": [
          {
            "title": "garments"
          },
          {
            "title": "textiles"
          },
          {
            "title": "pattern-making"
          },
          {
            "title": "trends"
          }
        ]
      },
      {
        "title": "Architecture",
        "children": [
          {
            "title": "design principles"
          },
          {
            "title": "structures"
          },
          {
            "title": "history"
          },
          {
            "title": "urban planning"
          }
        ]
      },
      {
        "title": "Interior Design",
        "children": [
          {
            "title": "space planning"
          },
          {
            "title": "materials"
          },
          {
            "title": "aesthetics"
          }
        ]
      }
    ]
  },
  {
    "name": "Media & Communication",
    "slug": "media-and-communication",
    "description": "",
    "tree": [
      {
        "title": "Communication Theory",
        "children": [
          {
            "title": "models"
          },
          {
            "title": "rhetoric"
          },
          {
            "title": "interpersonal communication"
          }
        ]
      },
      {
        "title": "Media Studies",
        "children": [
          {
            "title": "mass media"
          },
          {
            "title": "film"
          },
          {
            "title": "advertising"
          },
          {
            "title": "media effects"
          }
        ]
      },
      {
        "title": "Digital Media",
        "children": [
          {
            "title": "social media"
          },
          {
            "title": "content creation"
          },
          {
            "title": "online platforms"
          }
        ]
      },
      {
        "title": "Public Speaking",
        "children": [
          {
            "title": "presentation"
          },
          {
            "title": "persuasion"
          },
          {
            "title": "delivery"
          }
        ]
      },
      {
        "title": "Public Relations",
        "children": [
          {
            "title": "messaging"
          },
          {
            "title": "reputation"
          },
          {
            "title": "campaigns"
          }
        ]
      }
    ]
  },
  {
    "name": "Education & Learning",
    "slug": "education-and-learning",
    "description": "",
    "tree": [
      {
        "title": "Learning Science",
        "children": [
          {
            "title": "how people learn"
          },
          {
            "title": "memory"
          },
          {
            "title": "motivation"
          }
        ]
      },
      {
        "title": "Pedagogy",
        "children": [
          {
            "title": "teaching methods"
          },
          {
            "title": "lesson design"
          },
          {
            "title": "assessment"
          }
        ]
      },
      {
        "title": "Educational Psychology",
        "children": [
          {
            "title": "development"
          },
          {
            "title": "differences"
          },
          {
            "title": "special needs"
          }
        ]
      },
      {
        "title": "Study Skills",
        "children": [
          {
            "title": "note-taking"
          },
          {
            "title": "time management"
          },
          {
            "title": "exam preparation"
          }
        ]
      },
      {
        "title": "Curriculum Design",
        "children": [
          {
            "title": "standards"
          },
          {
            "title": "objectives"
          },
          {
            "title": "evaluation"
          }
        ]
      }
    ]
  },
  {
    "name": "Practical & Life Skills",
    "slug": "practical-and-life-skills",
    "description": "",
    "tree": [
      {
        "title": "Personal Finance",
        "children": [
          {
            "title": "budgeting"
          },
          {
            "title": "saving"
          },
          {
            "title": "financial goals"
          },
          {
            "title": "banking"
          },
          {
            "title": "credit"
          },
          {
            "title": "loans & debt"
          },
          {
            "title": "taxes"
          },
          {
            "title": "insurance"
          },
          {
            "title": "investing"
          },
          {
            "title": "retirement"
          },
          {
            "title": "car buying"
          },
          {
            "title": "housing"
          },
          {
            "title": "scams & fraud"
          },
          {
            "title": "careers & employment"
          }
        ]
      },
      {
        "title": "Cooking & Food",
        "children": [
          {
            "title": "techniques"
          },
          {
            "title": "cuisines"
          },
          {
            "title": "baking"
          },
          {
            "title": "nutrition basics"
          }
        ]
      },
      {
        "title": "Health & Fitness",
        "children": [
          {
            "title": "exercise"
          },
          {
            "title": "training"
          },
          {
            "title": "wellbeing"
          },
          {
            "title": "sleep"
          }
        ]
      },
      {
        "title": "Digital Literacy",
        "children": [
          {
            "title": "productivity tools"
          },
          {
            "title": "online safety"
          },
          {
            "title": "research skills"
          }
        ]
      },
      {
        "title": "Communication & Soft Skills",
        "children": [
          {
            "title": "negotiation"
          },
          {
            "title": "teamwork"
          },
          {
            "title": "emotional intelligence"
          }
        ]
      },
      {
        "title": "Crafts & DIY",
        "children": [
          {
            "title": "woodworking"
          },
          {
            "title": "sewing"
          },
          {
            "title": "home repair"
          },
          {
            "title": "gardening"
          }
        ]
      }
    ]
  }
];

function slugify(s: string): string {
  return s
    .toLowerCase()
    .replace(/&/g, "and")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "");
}

const subjects: Subject[] = [];
const nodes: Node[] = [];

SUBJECTS.forEach((subj, si) => {
  const subjectId = subj.slug;
  subjects.push({
    id: subjectId,
    name: subj.name,
    slug: subj.slug,
    description: subj.description,
    position: si,
  });

  const walk = (
    specs: NodeSpec[],
    parentId: string | null,
    parentPath: string[],
    depth: number,
  ) => {
    specs.forEach((spec, i) => {
      const slug = slugify(spec.title);
      const path = [...parentPath, slug];
      const id = `${subjectId}/${path.join("/")}`;
      nodes.push({
        id,
        subjectId,
        subjectSlug: subj.slug,
        parentId,
        title: spec.title,
        slug,
        summary: spec.summary ?? "",
        position: i,
        path,
        depth,
      });
      if (spec.children) walk(spec.children, id, path, depth + 1);
    });
  };

  walk(subj.tree, null, [], 0);
});

/** Number of nodes in a subject (used for the "N themes" label). */
export function themeCount(subjectId: string): number {
  return nodes.filter((n) => n.subjectId === subjectId).length;
}

export const SEED_SUBJECTS: Subject[] = subjects;
export const SEED_NODES: Node[] = nodes;
