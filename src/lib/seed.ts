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

export const SUBJECTS: SubjectSpec[] = [
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
            "title": "Demand and Supply Analysis",
            "summary": "How prices and quantities are set by the interaction of buyers and sellers — analyzed both from the individual consumer's side and from the firm's side.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "How demand and supply curves determine a market's equilibrium price and quantity, and what shifts each curve."
              },
              {
                "title": "Supply and Demand for Consumers",
                "summary": "Demand and supply from the individual consumer's perspective: how consumers respond to prices, income, and preferences, and how their choices aggregate into market demand."
              },
              {
                "title": "Supply and Demand for Firms",
                "summary": "Demand and supply from the firm's perspective: how a firm decides how much to produce and supply given its costs and market prices."
              }
            ]
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
            "title": "The Firm and Market Structures",
            "summary": "How a firm's costs shape its output decisions, and how a market's structure — from perfect competition to monopoly — shapes prices and power.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Breakeven, Shutdown, and Scale"
              },
              {
                "title": "Characteristics of Market Structures"
              },
              {
                "title": "Identifying Market Structures"
              }
            ]
          }
        ]
      },
      {
        "title": "Macroeconomics",
        "children": [
          {
            "title": "Aggregate Output, Prices, and Economic Growth",
            "summary": "The big-picture measures and forces of a national economy — what it produces, the overall price level, and what makes it grow over time.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "The core macroeconomic aggregates — output, income, the price level, and growth — and how they fit together."
              },
              {
                "title": "Aggregate Output and Income Measurement",
                "summary": "How a nation's output and income are measured (GDP and the national income accounts), and why total output equals total income."
              },
              {
                "title": "Aggregate Demand and Supply Analysis",
                "summary": "Using aggregate demand and aggregate supply to explain the level of output, the price level, inflation, and recessions."
              },
              {
                "title": "Economic Growth and Its Determinants",
                "summary": "What drives long-run economic growth — labor, capital, and productivity — and the factors that sustain or constrain it."
              }
            ]
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
            "title": "Understanding Business Cycles",
            "summary": "How economies expand and contract over time, and the forces that drive each phase of the cycle.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Business Cycles"
              }
            ]
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
            "title": "Monetary Policy",
            "summary": "How central banks use interest rates and the money supply to steer inflation and growth.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Central Bank Objectives and Tools"
              },
              {
                "title": "Monetary Policy Effects and Limitations"
              }
            ]
          },
          {
            "title": "Fiscal Policy",
            "summary": "How governments use spending and taxation to influence the economy.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Fiscal Policy Objectives"
              },
              {
                "title": "Fiscal Policy Tools and Implementation"
              }
            ]
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
        "title": "Global Economy",
        "children": [
          {
            "title": "International Trade",
            "summary": "Why countries trade, who gains, and how comparative advantage shapes the flow of goods across borders.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "International Trade"
              }
            ]
          },
          {
            "title": "trade restrictions & blocs"
          },
          {
            "title": "Capital Flows and the FX Market",
            "summary": "How money moves between countries, and how currencies are exchanged in the world's largest market.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "The Foreign Exchange Market"
              },
              {
                "title": "Managing Exchange Rates"
              }
            ]
          },
          {
            "title": "Exchange Rate Calculations",
            "summary": "How exchange rates are quoted, and how to compute cross rates and currency returns.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Foreign Exchange Rates"
              }
            ]
          },
          {
            "title": "Introduction to Geopolitics",
            "summary": "How cooperation and rivalry between states shape trade, capital, and markets.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Geopolitics"
              }
            ]
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
    "name": "Finance",
    "slug": "finance",
    "description": "",
    "tree": [
      {
        "title": "Quantitative Foundations",
        "summary": "The quantitative concepts and techniques used in financial analysis and investment decision-making — the time value of money, rates and returns, descriptive statistics, probability, and portfolio mathematics.",
        "children": [
          {
            "title": "Rates and Returns",
            "summary": "How interest rates and investment returns are defined and measured — the building blocks for comparing any investment.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "What an interest rate is, and the three equivalent ways to read it: as a required rate of return, as a discount rate used to bring future cash flows to the present, and as the opportunity cost of current consumption. An interest rate as the sum of a real risk-free rate plus premiums that compensate investors for bearing distinct types of risk — inflation, default, liquidity, and maturity risk. And how a return is measured over time, including how to calculate it."
              },
              {
                "title": "Interest Rates and Return Measurement"
              },
              {
                "title": "Time-Weighted and Money-Weighted Returns",
                "summary": "The money-weighted rate of return (the IRR of a portfolio's cash flows) and the time-weighted rate of return; how they differ and when each is appropriate; and how to evaluate and compare portfolio performance using these measures — including why time-weighted return is preferred for judging a manager."
              },
              {
                "title": "Common Measures of Return",
                "summary": "Gross vs net, pre-tax vs after-tax, real, and leveraged returns; annualized return measures (converting a return over any period into a comparable annual figure); and continuously compounded returns and how to compute them."
              }
            ]
          },
          {
            "title": "The Time Value of Money in Finance",
            "summary": "Why a dollar today is worth more than a dollar tomorrow, and how to move cash flows through time to value them.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Discounted Cash Flow Valuation",
                "summary": "Calculate and interpret the present value (PV) of fixed-income and equity instruments from their expected future cash flows."
              },
              {
                "title": "Implied Returns and Cash Flow Additivity",
                "summary": "Calculate and interpret the implied return of fixed-income instruments, and the required return and implied growth rate of equity instruments, given price (PV) and cash flows. Explain the cash flow additivity principle, why it underpins the no-arbitrage condition, and how it is used to compute implied forward interest rates, forward exchange rates, and option values."
              }
            ]
          },
          {
            "title": "Statistical Measures of Asset Returns",
            "summary": "How to summarize the distribution of asset returns — its center, spread, shape, and how returns move together.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "How descriptive statistics convey the important attributes of return data — measures of central tendency, location, and dispersion — and introduce the characteristics of a return distribution's shape, including skewness and kurtosis."
              },
              {
                "title": "Central Tendency and Dispersion",
                "summary": "Calculate, interpret, and evaluate measures of central tendency and location, and measures of dispersion, to address an investment problem."
              },
              {
                "title": "Skewness",
                "summary": "Interpret and evaluate the skewness of a return distribution to address an investment problem."
              },
              {
                "title": "Kurtosis",
                "summary": "Interpret and evaluate the kurtosis of a return distribution to address an investment problem."
              },
              {
                "title": "Correlation",
                "summary": "Interpret the correlation between two variables to address an investment problem."
              }
            ]
          },
          {
            "title": "Probability Trees and Conditional Expectations",
            "summary": "Using probability to reason about uncertain outcomes, form expectations, and update beliefs as new information arrives.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "The essentials of probability theory and how it is applied to quantify risk for investment decision-making — probabilities, expected values, and reasoning about uncertain outcomes."
              },
              {
                "title": "Probability Models",
                "summary": "Formulate an investment problem as a probability tree, and explain and apply conditional expectations in an investment setting."
              },
              {
                "title": "Expected Values",
                "summary": "Calculate expected values, variances, and standard deviations, and apply them to investment problems."
              },
              {
                "title": "Bayes’ Formula",
                "summary": "Calculate and interpret an updated (posterior) probability in an investment setting using Bayes’ formula."
              }
            ]
          },
          {
            "title": "Portfolio Mathematics",
            "summary": "How the returns and risks of individual assets combine into the return and risk of a whole portfolio.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Probability Models for Portfolio Return and Risk",
                "summary": "Calculate and interpret the expected value, variance, standard deviation, covariances, and correlations of portfolio returns."
              }
            ]
          }
        ]
      },
      {
        "title": "Statistical Methods",
        "children": [
          {
            "title": "Estimation and Inference",
            "summary": "How to draw conclusions about a whole population from a sample, and how sample means behave.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Sampling Techniques and the Central Limit Theorem"
              }
            ]
          },
          {
            "title": "Hypothesis Testing",
            "summary": "A formal procedure for using sample evidence to accept or reject a claim about a population.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Hypothesis Testing Basics"
              },
              {
                "title": "Types of Hypothesis Tests"
              }
            ]
          },
          {
            "title": "Parametric and Non-Parametric Tests of Independence",
            "summary": "Testing whether two variables move together, using correlation-based and rank/frequency-based methods.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Tests for Independence"
              }
            ]
          },
          {
            "title": "Simulation Methods",
            "summary": "Modelling uncertain outcomes by generating many random scenarios instead of solving in closed form.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Lognormal Distributions and Simulation Techniques"
              }
            ]
          },
          {
            "title": "Introduction to Linear Regression",
            "summary": "Fitting a straight line to describe how one variable depends on another, then judging how well it fits.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Linear Regression Basics"
              },
              {
                "title": "Analysis of Variance (ANOVA) and Goodness of Fit"
              },
              {
                "title": "Predicted Values and Functional Forms of Regression"
              }
            ]
          },
          {
            "title": "Introduction to Big Data Techniques",
            "summary": "How large, fast, and varied data — and fintech tools — are transforming financial analysis.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Introduction to Fintech"
              }
            ]
          }
        ]
      },
      {
        "title": "Financial Statement Analysis",
        "children": [
          {
            "title": "Introduction and Analysis Framework",
            "summary": "A general framework for conducting financial statement analysis: what it sets out to answer, the steps from gathering data to drawing conclusions, and how analysts use the statements to judge a company's performance, health, and prospects."
          },
          {
            "title": "Primary Financial Statements",
            "summary": "The primary financial statements — the income statement, the balance sheet, the statement of cash flows, and the statement of changes in equity — what each one shows and how they link together."
          },
          {
            "title": "Financial Reporting Procedures",
            "summary": "How economic transactions flow through the accounting system to become financial statements: the reporting process, the accounting equation, and accrual accounting."
          },
          {
            "title": "Financial Reporting Standards and Disclosures",
            "summary": "The standards that govern financial reporting and disclosure (such as IFRS and US GAAP), why they exist, and how required disclosures let users compare companies and judge quality."
          },
          {
            "title": "Accounting Methods and Their Effects",
            "summary": "How alternative accounting methods and choices — revenue recognition, inventory, depreciation, and off-balance-sheet structures — change the picture the statements paint, and how this can be abused. Use the Enron scandal as the cautionary case: off-balance-sheet entities hid debt and inflated earnings until the company collapsed in 2001, taking auditor Arthur Andersen with it and prompting the Sarbanes-Oxley Act."
          }
        ]
      },
      {
        "title": "Corporate Issuers",
        "summary": "How companies are owned, financed, and governed: the stakeholders a company must balance, corporate governance, how environmental and social factors enter investing (ESG), how firms use leverage, and how they manage working capital to meet short-term needs.",
        "children": [
          {
            "title": "Core Concepts",
            "summary": "What a corporate issuer is, the main forms of business organization, and how companies raise and allocate capital; and the key players — shareholders, the board, management, creditors, and other stakeholders."
          },
          {
            "title": "Stakeholder Management",
            "summary": "Identifying a company's stakeholders (shareholders, creditors, employees, customers, suppliers, regulators, and the community) and managing their sometimes-competing interests."
          },
          {
            "title": "Corporate Governance",
            "summary": "Corporate governance — the system of controls and incentives that directs a company; the conflicts of interest among managers, shareholders, and other stakeholders, the mechanisms that manage them, and their risks and benefits."
          },
          {
            "title": "ESG Considerations in Investing",
            "summary": "How environmental and social considerations are integrated into investing (ESG), and why they matter to both issuers and investors."
          },
          {
            "title": "Capital Structure and Leverage",
            "summary": "How companies make use of leverage — financing with debt alongside equity — and the benefits and risks of doing so."
          },
          {
            "title": "Working Capital and Liquidity",
            "summary": "How companies manage working capital and liquidity to meet short-term operational needs."
          }
        ]
      },
      {
        "title": "Equity Investments",
        "children": [
          {
            "title": "Characteristics of Equity Securities",
            "summary": "What equity investments are — ownership shares in a company — and their main types and features: common vs preferred stock, voting and ownership rights, and dividends, and how they differ across companies and markets."
          },
          {
            "title": "Security Markets and Indexes",
            "summary": "How security markets are organized, and how security market indexes are constructed, weighted, and used to measure and benchmark market performance."
          },
          {
            "title": "Industry and Company Analysis",
            "summary": "How to analyze an industry and an individual company — competitive position, business model, and value drivers — in order to evaluate an equity security."
          },
          {
            "title": "Equity Valuation Models",
            "summary": "Basic equity valuation models: present-value / dividend discount models, multiplier (multiples) models, and asset-based valuation."
          },
          {
            "title": "Global Equities",
            "summary": "Investing in equities around the world, and how global equity diversification supports longer-term growth and diversification objectives, in exchange for higher volatility than bonds."
          }
        ]
      },
      {
        "title": "Fixed Income",
        "children": [
          {
            "title": "Fixed-Income Securities",
            "summary": "What fixed-income securities are — bonds and other debt instruments — and their key features: issuer, maturity, coupon, principal, seniority, covenants, and embedded options."
          },
          {
            "title": "Fixed-Income Markets",
            "summary": "How fixed-income markets are organized: who issues bonds (governments, corporations, agencies), how they are sold and traded, and the main market sectors and instruments."
          },
          {
            "title": "Valuation of Fixed-Income Securities",
            "summary": "How to calculate the value (price) of a fixed-income security by discounting its expected cash flows, and the drivers of that value — market yields, credit spreads, and the shape of the yield curve."
          },
          {
            "title": "Yield Measures and Bond Returns",
            "summary": "Yield measures (yield to maturity, current yield, spot and forward rates), how to calculate them, and the fundamentals of what drives a bond's total return."
          },
          {
            "title": "Risk Factors",
            "summary": "The main risks of holding bonds — interest rate risk (measured by duration and convexity), credit risk, liquidity risk, and inflation risk — and how they interact. Ground interest rate risk in real episodes such as Paul Volcker's Fed rate hikes around 1980 and the sharp 2022 bond selloff."
          },
          {
            "title": "Securitization and Asset-Backed Securities",
            "summary": "How pools of loans (mortgages, auto loans, credit-card receivables) are packaged into tradable securities — ABS, MBS, and CDOs. Anchor it in the 2007–2008 subprime mortgage crisis, when mispriced mortgage-backed securities and CDOs helped trigger a global financial crisis."
          },
          {
            "title": "Introduction to Credit Analysis",
            "summary": "The basic principles of credit analysis — assessing a borrower's ability and willingness to repay, credit ratings, and yield spreads — illustrated with real defaults and downgrades such as the 2011 US credit-rating downgrade and the Greek and Argentine debt crises."
          }
        ]
      },
      {
        "title": "Derivatives",
        "summary": "Contracts whose value derives from an underlying asset: forwards, futures, swaps, and contingent claims (options). How derivative markets work, how arbitrage keeps prices in line, and why a derivative's price is tied to the price of its underlying.",
        "children": [
          {
            "title": "Core Concepts",
            "summary": "What a derivative is and how derivative markets work; the two families — forward commitments (forwards, futures, swaps) and contingent claims (options) — and the benefits and risks of using them."
          },
          {
            "title": "Forwards and Futures",
            "summary": "Forward and futures contracts lock in a price today for a transaction later; how futures differ from forwards (exchange-traded, standardized, marked to market daily)."
          },
          {
            "title": "Swaps",
            "summary": "Swaps as a series of forward commitments to exchange cash flows over time, such as interest rate swaps."
          },
          {
            "title": "Contingent Claims (Options)",
            "summary": "Options as contingent claims — the right, but not the obligation, to buy (call) or sell (put) an underlying; their payoffs and basic uses."
          },
          {
            "title": "Arbitrage and Replication",
            "summary": "Arbitrage — a riskless profit from mispricing — and how replicating a derivative's payoff with the underlying plus cash enforces its price under the no-arbitrage condition."
          },
          {
            "title": "Pricing Derivatives from the Underlying",
            "summary": "Why a derivative's price is tied to the price of its underlying asset, using arbitrage, replication, and the cost of carry."
          }
        ]
      },
      {
        "title": "Alternative Investments",
        "summary": "Assets beyond public stocks and bonds — private equity, hedge funds, real estate, commodities, and infrastructure — and why investors use them: diversification (returns that don't move in lockstep with public markets) and the potential for higher returns, in exchange for less liquidity, higher fees, and greater complexity.",
        "children": [
          {
            "title": "Core Concepts",
            "summary": "What counts as an alternative investment and how it differs from traditional stocks and bonds; the main categories (private equity, hedge funds, real estate, commodities, infrastructure); and the case for holding them — diversification and the potential for higher returns, weighed against illiquidity, higher fees, leverage, and valuation difficulty."
          },
          {
            "title": "Private Equity"
          },
          {
            "title": "Hedge Funds"
          },
          {
            "title": "Real Estate"
          },
          {
            "title": "Commodities and Natural Resources"
          },
          {
            "title": "Infrastructure"
          }
        ]
      },
      {
        "title": "Portfolio Planning and Wealth Management",
        "summary": "The fundamentals of portfolio and risk management — measuring return and risk, planning and constructing a portfolio — and how the needs of individual and institutional investors shape the investment solutions they choose.",
        "children": [
          {
            "title": "Portfolio Management Overview",
            "summary": "The fundamentals of portfolio and risk management: why investors hold diversified portfolios rather than single assets, the portfolio approach to return and risk, and the steps of the portfolio management process."
          },
          {
            "title": "Return and Risk Measurement",
            "summary": "How to measure a portfolio's return and its risk — expected return, variance and standard deviation — and how combining assets changes overall risk through diversification and correlation."
          },
          {
            "title": "Portfolio Risk and Return",
            "summary": "The trade-off between risk and return, how diversification reduces risk, and the efficient frontier. How the capital asset pricing model (CAPM) prices risk and is used to identify the optimal level of risk in a portfolio (the tangency/market portfolio and the security market line)."
          },
          {
            "title": "Portfolio Planning and Construction",
            "summary": "Turning an investor's goals and constraints into a real portfolio: the investment policy statement (IPS), risk tolerance and objectives, and strategic asset allocation."
          },
          {
            "title": "Retail vs Institutional Investors",
            "summary": "The basics — a retail (individual) investor manages their own or their household's money; an institutional investor (pension funds, endowments, insurers, sovereign wealth funds, mutual and hedge funds) invests large pools on behalf of others. How their goals, time horizons, resources, and interests diverge — vividly illustrated by the January 2021 GameStop short squeeze, when retail investors coordinating on Reddit's r/WallStreetBets drove the stock up and squeezed institutional hedge funds (such as Melvin Capital) that had shorted it."
          },
          {
            "title": "Investment Solutions",
            "summary": "The range of available investment solutions — from individual stocks and bonds to mutual funds, ETFs, separately managed accounts, and alternatives — and how each fits different investors' needs and constraints."
          }
        ]
      },
      {
        "title": "Ethics and Professional Standards",
        "children": [
          {
            "title": "The Role of Ethics and Professionalism",
            "summary": "Why ethics and professionalism are central to the investment industry: how trust underpins the profession, how ethical conduct differs from merely legal conduct, and what professionalism demands of practitioners."
          },
          {
            "title": "Challenges to Ethical Behavior",
            "summary": "Why even well-intentioned people act unethically — situational pressures, incentives, overconfidence, and the gap between how we expect to behave and how we actually do."
          },
          {
            "title": "A Framework for Ethical Decision-Making",
            "summary": "A structured, repeatable process for working through ethical dilemmas: identify the issue and stakeholders, weigh options and consequences, decide, act, and reflect."
          },
          {
            "title": "Industry Standards of Conduct",
            "summary": "The standards of professional conduct that govern behavior in the investment industry, and how they guide real day-to-day decisions."
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
            "title": "financial statements"
          },
          {
            "title": "housing & mortgages"
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
  },
  {
    "name": "Classics",
    "slug": "classics",
    "description": "",
    "tree": [
      {
        "title": "The Greek World",
        "children": [
          {
            "title": "Archaic Greece"
          },
          {
            "title": "Classical Athens"
          },
          {
            "title": "Alexander and the Hellenistic Age"
          },
          {
            "title": "Greek Mythology"
          },
          {
            "title": "Greek Philosophy"
          },
          {
            "title": "Greek Drama"
          }
        ]
      },
      {
        "title": "The Roman World",
        "children": [
          {
            "title": "The Roman Republic"
          },
          {
            "title": "The Roman Empire"
          },
          {
            "title": "Roman Law"
          },
          {
            "title": "Roman Religion"
          },
          {
            "title": "Roman Literature"
          },
          {
            "title": "The Fall of Rome"
          }
        ]
      },
      {
        "title": "Classical Languages",
        "children": [
          {
            "title": "Ancient Greek"
          },
          {
            "title": "Latin"
          },
          {
            "title": "Classical Rhetoric"
          }
        ]
      },
      {
        "title": "Legacy of Antiquity",
        "children": [
          {
            "title": "Classical Reception"
          },
          {
            "title": "Archaeology of the Ancient World"
          },
          {
            "title": "Myth in Modern Culture"
          }
        ]
      }
    ]
  },
  {
    "name": "Neuroscience",
    "slug": "neuroscience",
    "description": "",
    "tree": [
      {
        "title": "Cellular Neuroscience",
        "children": [
          {
            "title": "Neurons"
          },
          {
            "title": "The Synapse"
          },
          {
            "title": "Action Potentials"
          },
          {
            "title": "Neurotransmitters"
          },
          {
            "title": "Glial Cells"
          }
        ]
      },
      {
        "title": "Brain Systems",
        "children": [
          {
            "title": "Vision"
          },
          {
            "title": "Hearing"
          },
          {
            "title": "Movement and Motor Control"
          },
          {
            "title": "The Limbic System"
          },
          {
            "title": "Sleep and Circadian Rhythms"
          }
        ]
      },
      {
        "title": "Cognitive Neuroscience",
        "children": [
          {
            "title": "Perception"
          },
          {
            "title": "Attention"
          },
          {
            "title": "Learning and Memory"
          },
          {
            "title": "Language"
          },
          {
            "title": "Consciousness"
          }
        ]
      },
      {
        "title": "Methods in Neuroscience",
        "children": [
          {
            "title": "Brain Imaging"
          },
          {
            "title": "Electrophysiology"
          },
          {
            "title": "Optogenetics"
          }
        ]
      },
      {
        "title": "Clinical Neuroscience",
        "children": [
          {
            "title": "Neuroplasticity"
          },
          {
            "title": "Neurodegeneration"
          },
          {
            "title": "Stroke and Brain Injury"
          },
          {
            "title": "The Neuroscience of Mental Illness"
          }
        ]
      }
    ]
  },
  {
    "name": "Statistics",
    "slug": "statistics",
    "description": "",
    "tree": [
      {
        "title": "Descriptive Statistics",
        "children": [
          {
            "title": "Measures of Center"
          },
          {
            "title": "Measures of Spread"
          },
          {
            "title": "Distributions"
          },
          {
            "title": "Data Visualization"
          }
        ]
      },
      {
        "title": "Probability",
        "children": [
          {
            "title": "Probability Basics"
          },
          {
            "title": "Random Variables"
          },
          {
            "title": "Common Distributions"
          },
          {
            "title": "Bayes' Theorem"
          }
        ]
      },
      {
        "title": "Statistical Inference",
        "children": [
          {
            "title": "Sampling"
          },
          {
            "title": "Estimation"
          },
          {
            "title": "Confidence Intervals"
          },
          {
            "title": "Hypothesis Testing"
          },
          {
            "title": "P-values and Significance"
          }
        ]
      },
      {
        "title": "Regression and Modeling",
        "children": [
          {
            "title": "Correlation"
          },
          {
            "title": "Linear Regression"
          },
          {
            "title": "Logistic Regression"
          },
          {
            "title": "ANOVA"
          }
        ]
      },
      {
        "title": "Modern Statistics",
        "children": [
          {
            "title": "Experimental Design"
          },
          {
            "title": "Bayesian Statistics"
          },
          {
            "title": "Resampling Methods"
          },
          {
            "title": "Statistical Learning"
          }
        ]
      }
    ]
  },
  {
    "name": "Africana Studies",
    "slug": "africana-studies",
    "description": "",
    "tree": [
      {
        "title": "African History",
        "children": [
          {
            "title": "Precolonial Africa"
          },
          {
            "title": "The Transatlantic Slave Trade"
          },
          {
            "title": "Colonial Africa"
          },
          {
            "title": "Decolonization"
          },
          {
            "title": "Contemporary Africa"
          }
        ]
      },
      {
        "title": "The African American Experience",
        "children": [
          {
            "title": "Slavery in America"
          },
          {
            "title": "Reconstruction"
          },
          {
            "title": "The Jim Crow Era"
          },
          {
            "title": "The Civil Rights Movement"
          },
          {
            "title": "Black Power and After"
          }
        ]
      },
      {
        "title": "Black Thought and Politics",
        "children": [
          {
            "title": "Pan-Africanism"
          },
          {
            "title": "Black Feminism"
          },
          {
            "title": "Critical Race Theory"
          }
        ]
      },
      {
        "title": "Diaspora and Culture",
        "children": [
          {
            "title": "The African Diaspora"
          },
          {
            "title": "Black Literature"
          },
          {
            "title": "Black Music and Art"
          }
        ]
      }
    ]
  },
  {
    "name": "Asian Studies",
    "slug": "asian-studies",
    "description": "",
    "tree": [
      {
        "title": "East Asia",
        "children": [
          {
            "title": "Chinese History"
          },
          {
            "title": "Japanese History"
          },
          {
            "title": "Korean History"
          }
        ]
      },
      {
        "title": "South Asia",
        "children": [
          {
            "title": "Indian History"
          },
          {
            "title": "Religions of India"
          },
          {
            "title": "Modern South Asia"
          }
        ]
      },
      {
        "title": "Southeast Asia",
        "children": [
          {
            "title": "Southeast Asian History"
          },
          {
            "title": "Cultures of Southeast Asia"
          }
        ]
      },
      {
        "title": "Asian Thought",
        "children": [
          {
            "title": "Confucianism"
          },
          {
            "title": "Daoism"
          },
          {
            "title": "Buddhism"
          },
          {
            "title": "Hinduism"
          }
        ]
      },
      {
        "title": "Language and Literature",
        "children": [
          {
            "title": "East Asian Languages"
          },
          {
            "title": "Asian Literature"
          }
        ]
      }
    ]
  },
  {
    "name": "Gender Studies",
    "slug": "gender-studies",
    "description": "",
    "tree": [
      {
        "title": "Foundations",
        "children": [
          {
            "title": "Sex and Gender"
          },
          {
            "title": "Feminist Theory"
          },
          {
            "title": "Intersectionality"
          },
          {
            "title": "Patriarchy"
          }
        ]
      },
      {
        "title": "History of Feminism",
        "children": [
          {
            "title": "The First Wave"
          },
          {
            "title": "The Second Wave"
          },
          {
            "title": "Third and Fourth Waves"
          },
          {
            "title": "Global Feminisms"
          }
        ]
      },
      {
        "title": "Sexuality and Queer Studies",
        "children": [
          {
            "title": "LGBTQ History"
          },
          {
            "title": "Queer Theory"
          },
          {
            "title": "Identity and Sexuality"
          }
        ]
      },
      {
        "title": "Gender in Society",
        "children": [
          {
            "title": "Gender and Work"
          },
          {
            "title": "Gender and Politics"
          },
          {
            "title": "Media and Representation"
          },
          {
            "title": "Masculinities"
          }
        ]
      }
    ]
  },
  {
    "name": "Folklore & Mythology",
    "slug": "folklore-and-mythology",
    "description": "",
    "tree": [
      {
        "title": "World Mythologies",
        "children": [
          {
            "title": "Greek Mythology"
          },
          {
            "title": "Norse Mythology"
          },
          {
            "title": "Egyptian Mythology"
          },
          {
            "title": "Mesopotamian Mythology"
          },
          {
            "title": "Asian Mythologies"
          },
          {
            "title": "African Mythologies"
          }
        ]
      },
      {
        "title": "Folktales and Legends",
        "children": [
          {
            "title": "Fairy Tales"
          },
          {
            "title": "Legends"
          },
          {
            "title": "Urban Legends"
          },
          {
            "title": "Fables"
          }
        ]
      },
      {
        "title": "Myth and Motif",
        "children": [
          {
            "title": "Creation Myths"
          },
          {
            "title": "Hero Myths"
          },
          {
            "title": "Tricksters"
          },
          {
            "title": "The Afterlife"
          }
        ]
      },
      {
        "title": "Studying Myth",
        "children": [
          {
            "title": "Comparative Mythology"
          },
          {
            "title": "Folklore Theory"
          },
          {
            "title": "Oral Tradition"
          }
        ]
      }
    ]
  },
  {
    "name": "Film",
    "slug": "film",
    "description": "",
    "tree": [
      {
        "title": "Film History",
        "children": [
          {
            "title": "Silent Cinema"
          },
          {
            "title": "The Studio Era"
          },
          {
            "title": "World Cinema"
          },
          {
            "title": "The New Waves"
          },
          {
            "title": "Contemporary Film"
          }
        ]
      },
      {
        "title": "Film Theory and Criticism",
        "children": [
          {
            "title": "Film Language"
          },
          {
            "title": "Genre Theory"
          },
          {
            "title": "Auteur Theory"
          },
          {
            "title": "Film Criticism"
          }
        ]
      },
      {
        "title": "The Craft of Film",
        "children": [
          {
            "title": "Directing"
          },
          {
            "title": "Cinematography"
          },
          {
            "title": "Editing"
          },
          {
            "title": "Screenwriting"
          },
          {
            "title": "Sound Design"
          }
        ]
      },
      {
        "title": "Forms and Genres",
        "children": [
          {
            "title": "Documentary"
          },
          {
            "title": "Animation"
          },
          {
            "title": "Experimental Film"
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
